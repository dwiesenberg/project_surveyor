Rails.application.routes.draw do
  root 'surveys#index'

  resources :surveys, :only => [:index, :new, :create] do
    resources :questions
    resources :responses, :only => [:index, :new, :create]
  end

  get '/questions/:id/edit_options', 
    to: 'questions#edit_options', 
    as: 'question_edit_options'

  patch '/questions/:id/update_options', 
    to: 'questions#update_options', 
    as: 'question_update_options'

end
