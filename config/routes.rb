Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

root to: 'home#top'
get "/about" => "home#about"

resource :user, only: [:show, :edit, :update]
 get "/users/quit" => "uers#quit"
 put "/users/hide" => "users#hide"
 get "/users/thank" => "user#thank"
resources :foods
resources :categories, only: [:new, :create, :index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

namespace :admins do
	root to: "home#top"
	resources :users, only: [:index, :show, :edit, :update]
end

end
