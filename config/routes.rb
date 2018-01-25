Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  get "visitors/per_question_graph"# => "visitors#per_question_graph"
  resources :questions, :responses, :users, :tests, :visitors
end
