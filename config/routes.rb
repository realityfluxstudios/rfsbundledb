Rails.application.routes.draw do
  root 'home#index'

  scope 'api' do
    resources :bundles
    resources :games
    resources :musictracks
    resources :drm_free_games
    resources :androidgames
  end
end
