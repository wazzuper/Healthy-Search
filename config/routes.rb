Rails.application.routes.draw do
  root 'pages#home'

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
