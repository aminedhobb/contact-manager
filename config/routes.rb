Rails.application.routes.draw do
  resources :contacts
  root to: 'contacts#index'
  Precompile.ignore { ActiveAdmin.routes(self) }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
