Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'vacancies#index'

  resources :vacancies do
    get :candidates, on: :member
  end

  resources :candidates do
    get :vacancies, on: :member
  end

  resources :skills, only: [] do
    get :search, on: :collection
  end
end
