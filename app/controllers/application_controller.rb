class ApplicationController < ActionController::API
  before_action :authorize_api_request
  attr_reader :current_user

  private

  def authorize_api_request
    @current_user = AuthorizeApiRequest.call(request.headers)[:ok]
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
