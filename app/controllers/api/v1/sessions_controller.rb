class Api::V1::SessionsController < ActionController::API
  def create
    @user = User.find_by(username: params[:username])
    if @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      render :template => "api/v1/users/show", status: :ok
    else
      render :template => "api/v1/empty", status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render :template => "api/v1/empty", status: :ok
  end
end
