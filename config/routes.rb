Rails.application.routes.draw do
  get 'home', to: 'home#index'
  post 'jokes/:joke_id/like', to: 'home#like', as: 'like'
  post 'jokes/:joke_id/dislike', to: 'home#dislike', as: 'dislike'
  root 'home#index'
end
