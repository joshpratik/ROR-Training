Rails.application.routes.draw do
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }
  get "members", to: "members#index"
  get "current_user", to: "members#current_user"
end
