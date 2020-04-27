Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "api/v1/users", sessions: "api/v1/sessions" }, defaults: { format: :json }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      controller :sessions do
        post "login" => :create
        delete "logout" => :destroy
      end
      resources :articles
      resources :users
    end
  end
end
