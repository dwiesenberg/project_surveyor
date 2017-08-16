Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'surveys#index'

  resources :surveys, only: [:index, :new, :create] do
    resources :questions
    # resources :responses, only: [:index, :new, :create]
  end


  get '/questions/:id/edit_options',
    to: 'questions#edit_options',
    as: 'questions_edit_options'

  patch '/questions/:id/update_options',
    to: 'questions#update_options',
    as: 'questions_update_options'

  get   '/surveys/:id/survey_response_new',
    to: 'surveys#survey_response_new',
    as: 'survey_response_new'

  patch  '/surveys/:id/survey_response_create',
    to: 'surveys#survey_response_create',
    as: 'survey_response_create'

  get   '/surveys/:id/survey_responses_show',
    to: 'surveys#survey_responses_show',
    as: 'survey_responses_show'


end
