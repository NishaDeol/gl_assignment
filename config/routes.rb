Rails.application.routes.draw do
  match '/people/form',    to: 'people#form', via: [:get, :post]
  post 'update_details', to: 'people#update_details'
  root 'people#form'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
