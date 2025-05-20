Rails.application.routes.draw do

  root 'shortener#new'

  get  'shortener',      to: 'shortener#new',     as: :shortener
  post 'shortener',      to: 'shortener#create'
  get  'shortener/list', to: 'shortener#index',   as: :shortener_list

  # Redirección por short code
  get '/s/:short_code', to: 'api/v1/url#redirect', as: :redirect_short

  namespace :api do
    namespace :v1 do

      resources :url

    end
  end

end