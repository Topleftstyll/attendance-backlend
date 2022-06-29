Rails.application.routes.draw do
  resources :groups
  devise_for :users,
              controllers: {
                  sessions: 'users/sessions',
                  registrations: 'users/registrations'
              }
              
  namespace :api do
    namespace :v1 do
      resources :guardians
      resources :teachers
      resources :groups
      resources :children
      resources :current_users, :path => 'current-user', :as => :check_user
    end
  end
end
