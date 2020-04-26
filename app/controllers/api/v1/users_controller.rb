class Api::V1::UsersController < ActionController::API
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
    render status: :ok
  end

  def show
    render status: :ok
  end

  def create
    @user = User.new(user_param)
    if @user.save
      session[:user_id] = @user.id
      render :template => "api/v1/users/show", status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user.update(user_param)
    if @user.save
      render :template => "api/v1/users/show", status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render :template => "api/v1/empty", status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :template => "api/v1/empty", status: :not_found
  end

  def user_param
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
