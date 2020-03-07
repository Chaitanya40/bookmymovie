class AuthorizeApiRequest < Rectify::Command
  def initialize(headers = {})
    @headers = headers
  end

  def call
    broadcast(:error, errors.all) and return unless decoded_auth_token
    broadcast(:error, errors.all) and return unless user
    broadcast(:ok, @user) 
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token[:user_id])
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end