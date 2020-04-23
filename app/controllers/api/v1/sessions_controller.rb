class Api::V1::SessionsController < ActionController::API
  def create
    user = User.find_by(username: params[:username])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      render :json => user, status: :ok
    else
      render status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render status: :ok
  end
end
