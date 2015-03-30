Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: "users/registrations" }
  
  ## Routes ##
  root 'users#show'
  
  resources :competencies
  resources :learning_goals
 
end
