Rails.application.routes.draw do
  root 'pages#home'

  get 'registration_page', to: 'pages#registration', as: :registration_page
  get 'login_page', to: 'pages#login', as: :login_page

  devise_for :patients, path: 'patients',
  controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations',
    passwords: 'patients/passwords'
  },
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    edit: 'profile',
    sign_up: 'registration'
  }

  devise_for :doctors, path: 'doctors', controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations',
    passwords: 'doctors/passwords'
  },
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    edit: 'profile',
    sign_up: 'registration'
  }

  resources :doctors, except: [:new, :create, :edit] do
    member do
      get 'address'
      get 'photo_upload'
      get 'bio'
      get 'reviews'
      get 'profile_area'
      get 'specialization'
      get 'price'
      get 'visiting_days'
    end
    resources :visiting_days, only: [:show, :create, :destroy] do
      resources :visiting_hours, only: [:create, :destroy]
    end
  end

  resources :patients, except: [:index, :show, :new, :create, :edit] do
    member do
      get 'appointments'
      get 'reviews'
    end
    resources :reviews, except: [:index, :new, :show]
  end

  resources :appointments, only: [:new, :create, :show]
  resources :specializations
end
