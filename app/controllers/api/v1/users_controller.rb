class Api::V1::UsersController < Devise::RegistrationsController
  def create
    super { |resource|
      @user = resource
    }
  end
end
