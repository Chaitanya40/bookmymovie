class AuthorizeApiRequest < SimpleCommand
  def initialize(headers = {})
    @headers = headers
  end

  def call
    decode_auth_token
    broadcast(:error, errors.all) && return unless auth_token_decoded?
    broadcast(:error, errors.all) && return unless user
    broadcast(:ok, @user)
  end

  private

  attr_reader :headers

  def user
    @user ||= Customer.find(@decoded_auth_token[:user_id])
    errors.add(token: 'Invalid token') unless @user
    @user
  end

  def auth_token_decoded?
    errors.add(token: 'Invalid token') unless @decoded_auth_token
    @decoded_auth_token
  end

  def decode_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(token: 'Missing token')
    end

    nil
  end
end
