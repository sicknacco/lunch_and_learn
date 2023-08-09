Rails.application.routes.draw do
  get '/api/v1/recipes', to: 'api/v1/recipes#index'

  get '/api/v1/learning_resources', to: 'api/v1/learning_resources#index'

  get '/api/v1/air_quality', to: 'api/v1/air_quality#index'

  post '/api/v1/users', to: 'api/v1/users#create'

  post '/api/v1/sessions', to: 'api/v1/sessions#create'

  post '/api/v1/favorites', to: 'api/v1/favorites#create'
  get '/api/v1/favorites', to: 'api/v1/favorites#index'

  get '/api/v1/book_search', to: 'api/v1/book_search#index'
end
