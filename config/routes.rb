Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "home#index"
  get "/contact-us", :to => "contact#index", as: "contact"
  get "/check-availability", :to => "users#update_diems"
  get "/availability", :to => "availability#index"
  get "/create-availability", :to => "availability#manipulate"
  get "/how-it-works", :to => "info#index", as: "info"
  resources :users
end
