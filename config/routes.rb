Rails.application.routes.draw do
  resources :projects

  namespace :api do
    namespace :v1 do
      resources :projects do
        patch '/todos/:id' => 'todos#update'
      end
      post '/todos' => 'todos#create'
      end
    end
  end