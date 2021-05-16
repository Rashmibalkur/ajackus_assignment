Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "contacts#contact"

  resources :contacts, :only => [:create, :index]
  
  match '*path' => redirect('/'), via: :get

end
