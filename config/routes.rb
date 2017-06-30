Rails.application.routes.draw do
  devise_for :companies, controllers: {sessions: "companies/sessions"}, path_names: {sign_in: 'login'}
  get "static_pages/user_home"
  get "static_pages/admin_home"

  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

end
