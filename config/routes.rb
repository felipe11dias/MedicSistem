Rails.application.routes.draw do
  
  # root "application#root"

  resources :surgeries
  resources :clients
  resources :rooms

  get 'doctors/index'
  get 'doctors/show'
  get 'pages/index'
  get 'pages/home'
  get 'pages/show_surgeries'

  get '/edit-doctor/:id', to: "managers/doctors#edit", as: "manager_edit_doctor"
  put '/edit-doctor/:id', to: "managers/doctors#update", as: "manager_update_doctor"

  get '/new-doctor', to: "managers/doctors#new", as: "manager_new_doctor"
  post '/new-doctor', to: "managers/doctors#create", as: "manager_create_doctor"

  delete '/destroy-doctor/:id', to: "managers/doctors#destroy", as: "manager_destroy_doctor"

  devise_for :doctors, path: 'doctors', controllers: { sessions: "doctors/sessions", registrations: "doctors/registrations"}
  # eg. http://localhost:3000/doctors/sign_in
  devise_for :managers, path: 'managers', controllers: { sessions: "managers/sessions", registrations: "managers/registrations"}
  # eg. http://localhost:3000/managers/sign_in

  devise_scope :manager do
    authenticated :manager do
      root 'pages#index', as: :authenticated_root
    end
    unauthenticated do
      root 'managers/sessions#new', as: :unauthenticated_root
    end
  end
 
  # devise_scope :doctor do
  #   authenticated :doctor do
  #     root 'pages#home', as: :authenticated_root
  #   end
  
  #   unauthenticated do
  #     root 'doctors/sessions#new', as: :unauthenticated_root
  #   end
  # end
 
end