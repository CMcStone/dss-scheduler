DssScheduler::Application.routes.draw do
  resources :resources
  match '/reservations/wizard', :controller => 'reservations', :action => 'wizard'
  resources :reservations

  get '/welcome', :controller => "application", :action => "welcome"
  get '/logout', :controller => "application", :action => "logout"
  root :to => 'application#welcome'
end
