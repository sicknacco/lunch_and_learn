Rails.application.routes.draw do
  get '/api/v1/recipes', to: 'api/v1/recipes#index'

  get '/api/v1/learning_resources', to: 'api/v1/learning_resources#index'

  post '/api/v1/users', to: 'api/v1/users#create'
end
