Rails.application.routes.draw do
  get 'memo/index'
  devise_for :users
end
