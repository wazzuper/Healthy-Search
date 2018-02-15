Rails.application.routes.draw do
  devise_for :patients, path: 'patients', controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations',
    passwords: 'patients/passwords'
  }

  # devise_scope :patient do
  #   get 'sign_in', to: 'patients/sessions#new'
  # end

  devise_for :doctors, path: 'doctors', controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations',
    passwords: 'doctors/passwords'
  }

  # devise_scope :doctor do
  #   get 'sign_in', to: 'doctors/sessions#new'
  # end
end
