class AuthenticateUser < SimpleCommand
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    broadcast(:error, errors.all) and return unless user_found?
    broadcast(:error, errors.all) and return unless credentials_valid?
    broadcast(:ok, generate_token)
  end

  private

  attr_accessor :email, :password

  def user_found?
    @user = Customer.find_by_email(email)
    errors.add(user_authentication: 'User not found') unless @user
    @user.present?
  end
  
  def credentials_valid?
    is_valid_password = @user.authenticate(password)
    errors.add(user_authentication: 'Invalid credentials') unless is_valid_password
    is_valid_password
  end
  
  def generate_token
    JsonWebToken.encode(user_id: @user.id)
  end
end
