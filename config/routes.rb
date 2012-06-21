DssScheduler::Application.routes.draw do
  resources :resources
  resources :reservations

  root :to => 'site#index'
end
