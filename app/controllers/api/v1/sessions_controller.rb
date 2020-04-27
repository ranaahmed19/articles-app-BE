class Api::V1::SessionsController < Devise::SessionsController
  # before_action :authenticate_user!

  def create
    super { |resource|
      @user = resource
    }
  end
end
