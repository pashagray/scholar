Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  post 'table_config', to: 'table_config#update'

  namespace :admin do
    get '/', to: 'welcome#index'
    resources :users do
      collection do
        get 'students'
        get 'teachers'
        get 'custodians'
        get 'admins'
      end
      member do
        post 'reset_password'
      end
      resources :student_profiles
      resources :teacher_profiles
      resources :custodian_profiles
      resources :admin_profiles
    end
  end

  namespace :teacher do
    get '/', to: 'welcome#index'
  end

  namespace :student do
    get '/', to: 'welcome#index'
  end

  namespace :no_role do
    get '/', to: 'welcome#index'
  end
end
