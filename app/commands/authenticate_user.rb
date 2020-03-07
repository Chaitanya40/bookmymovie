class AuthenticateUser < SimpleCommand
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    broadcast(:error, errors) and return unless user_found?
    broadcast(:errors, errors) and return unless credentials_valid?
    broadcast(:ok, generate_token)
  end

  private

  attr_accessor :email, :password

  def user_found?
    @user = User.find_by_email(email)
    errors.add('User not found' unless @user
    @user.exists?
  end
  
  def credentials_valid?
    is_valid_password = @user.authenticate(password)
    errors.add :user_authentication, 'Invalid credentials' unless is_valid_password
    is_valid_password
  end
  
  def generate_token
    JsonWebToken.encode(user_id: @user.id)
  end
end
