class Api::V1::SessionsController < Devise::SessionsController
  def create
    super { |resource|
      @user = resource
    }
  end
end
