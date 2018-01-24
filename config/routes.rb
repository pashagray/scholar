Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # notify_to :users, with_devise: :users

  root to: 'welcome#index'

  post 'table_config', to: 'table_config#update'

  namespace :my do
    get '/', to: 'welcome#index'
    get '/messenger', to: 'messenger#index'

    get '/school', to: 'user_groups#school'
    resources :user_groups do
      resources :adverts
    end

    get '/change_password', to: 'welcome#change_password'
    post '/confirm_change_password', to: 'welcome#confirm_change_password'

    resources :users

    resources :notifications do
      member do
        patch 'mark_as_read'
      end
    end
  end

  namespace :multirole do
    get '/', to: 'welcome#index'
  end

  namespace :admin do
    get '/', to: 'welcome#index'
    resources :settings
    resources :subjects
    resources :academic_periods do
      resources :academic_fractions
    end

    get 'schedule', to: 'journals#schedule'
    get 'schedule_generator', to: 'journals#schedule_generator'

    resources :journals do
      resources :journal_fractions do
        member do
          post 'create_lessons'
        end
      end
    end

    resources :lessons

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
    resources :study_groups do
      member do
        post 'assign_student'
        post 'remove_student'

        post 'assign_supervisor'
        post 'remove_supervisor'
      end
      resources :study_sub_groups do
        member do
          post 'assign_student'
          post 'remove_student'
        end
      end
    end
  end

  namespace :teacher do
    get '/', to: 'welcome#index'

    get '/teachers_room', to: 'user_groups#teachers_room'
    resources :user_groups do
      resources :adverts
    end

    resources :study_groups do
      collection do
        get 'supervising'
      end
      member do
        get 'passwords'
      end
      resources :adverts
    end
    resources :users
  end

  namespace :student do
    get '/', to: 'welcome#index'
  end

  namespace :no_role do
    get '/', to: 'welcome#index'
  end
end
