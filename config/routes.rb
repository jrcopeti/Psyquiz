Rails.application.routes.draw do
  get 'submissions/create'
  get 'submissions/show'
  devise_for :users
  root to: "pages#home"

  resources :quizzes do
    resources :questions
  end

  resources :submissions, only: %i[show create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
