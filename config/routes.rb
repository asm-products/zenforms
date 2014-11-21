Rails.application.routes.draw do

  # get 'employees/import'
  get 'form/:token', to: 'forms#new', as:'form_with_token'
  devise_for :users
  root to: 'high_voltage/pages#show', id: 'home'

  resources :employees do
    collection do
      get 'import'
    end
  end

  resources :forms, only: :create

end
