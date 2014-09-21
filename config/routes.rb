Rails.application.routes.draw do
  root 'home#index'

  get '/api/check_steam_id/:steam_id', to: 'games#check_steam_id'

  scope 'api' do
    resources :bundles
    resources :games
    resources :musictracks
    resources :drm_free_games
    resources :androidgames
    resources :ebooks
  end

end
