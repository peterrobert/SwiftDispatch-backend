class SessionsController < ApplicationController
  skip_before_action :set_current_tenant_and_user, only: [ :create ]

  def create
    tenant = Tenant.find_by!(subdomain: request.subdomain)
    Current.tenant = tenant

    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id, tenant_id: user.tenant_id)
      render json: { token: token, user: { id: user.id, full_name: user.full_name, role: user.role } }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
