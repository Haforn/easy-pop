Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: "users/registrations" }
  
  ## Routes ##
  root 'users#show'
  
  resources :competencies

  resources :learning_goals

 	resources :learn_moments

 	resources :logs

 	get 'teams/join', to: 'team_members#join', as: 'join_team'
 	get 'teams/undo', to: 'team_members#undo', as: 'undo_team'

 	resources :teams
 	get 'teams/:id/add', to: 'team_members#add', as: 'add_team_member'
 	get 'teams/:id/remove', to: 'team_members#remove', as: 'remove_request'
 	get 'teams/:id/leave', to: 'team_members#leave_team', as: 'leave_team'

 	resources :generate_pdfs, only: [:index]

 	get 'view_user/:id', to: 'view_users#show', as: 'view_user' 

 	#resources

end
