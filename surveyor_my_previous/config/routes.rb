Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "admin/surveys#index"

  namespace :admin do
    resources :surveys

    resources :questions do
      resources :choices
    end

    get '/questions/new' => 'questions#new_multiple_choice_1', 
      as: 'new_multiple_choice_1'

    post '/questions' => 'questions#create_multiple_choice_1', 
      as: 'create_multiple_choice_1'

    get '/questions/new' => 'questions#new_multiple_choice_2', 
      as: 'new_multiple_choice_2'

    post '/questions' => 'questions#create_multiple_choice_2', 
      as: 'create_multiple_choice_2'

    get '/questions/new' => 'questions#new_number_range', 
      as: 'new_number_range'

    post '/questions' => 'questions#create_number_range', 
      as: 'create_number_range'

  end

end

