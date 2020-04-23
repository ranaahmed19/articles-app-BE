class Api::V1::UsersController < ActionController::API
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.order(created_at: :DESC)
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_param)
    p "paraaaaaaaaaaaams #{user_param}"
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user.update(user_param)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_param
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
