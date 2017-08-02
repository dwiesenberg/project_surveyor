Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "admin/surveys#index"

  namespace :admin do
    resources :surveys, only: :index
    # "only ... " to be removed shortly
  end

end
