Rails.application.routes.draw do
  root 'pages#home'

  get 'registration_page', to: 'pages#registration', as: :registration_page
  get 'login', to: 'pages#login', as: :login

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
end
