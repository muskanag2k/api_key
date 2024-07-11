Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    post '/keys/generate', to: 'keys#generate'
    get '/keys/get_available', to: 'keys#get_available'
    put '/keys/:key_value/unblock', to: 'keys#unblock'
    delete '/keys/:key_value', to: 'keys#delete'
    get '/keys/get_all_available_keys', to: 'keys#get_all_available_keys'
    get '/keys/get_all_blocked_keys', to: 'keys#get_all_blocked_keys'
end
