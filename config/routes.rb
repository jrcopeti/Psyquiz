Rails.application.routes.draw do
  get 'submissions/create'
  get 'submissions/show'
  post 'questions/:id/answer', to: 'questions#answer', as: 'answer_question'

  devise_for :users
  root to: "pages#home"

  resources :quizzes do
    resources :questions
    resources :submissions, only: %i[show create], as: 'submissions' do
      member do
        get 'review'
      end
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
