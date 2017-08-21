Rails.application.routes.draw do
  get '' => 'users#index'
  post 'users' => 'users#create'

  post 'login' => 'sessions#create'
end
