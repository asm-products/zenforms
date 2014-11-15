Rails.application.routes.draw do

  # get 'employees/import'

  devise_for :users
  root to: 'high_voltage/pages#show', id: 'home'

  resources :employees do
    collection do
      get 'import'
    end
  end

end
