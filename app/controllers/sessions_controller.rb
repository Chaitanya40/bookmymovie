class SessionsController < ApplicationController
  def create
    AuthenticateUser.call(params[:email], params[:password]) do 
      on(:ok) { |auth_token| render json: { token: auth_token } }
      on(:error) { |errors| render json: { error: errors } }, status: :unauthorized
    end  
  end  
end  