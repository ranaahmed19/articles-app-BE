class Api::V1::SessionsController < ActionController::API
  def create
    @user = User.find_by(username: session_params[:username])
    if @user.try(:authenticate, session_params[:password])
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

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
