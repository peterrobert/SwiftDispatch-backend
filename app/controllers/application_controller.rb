class ApplicationController < ActionController::API
  before_action :set_current_tenant_and_user

  private

  def set_current_tenant_and_user
    header = request.headers["Authorization"]
    token = header.split(" ").last if header

    decoded = JsonWebToken.decode(token)
    Current.tenant = Tenant.find(decoded[:tenant_id])
    Current.user = User.find(decoded[:user_id])
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    render json: { error: "Unauthorized" }, status: :unauthorized
  end
end
