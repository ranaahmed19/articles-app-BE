class CustomFailureApp < Devise::FailureApp
  def respond
    json_error_response
  end

  def json_error_response
    self.status = 401
  end
end
