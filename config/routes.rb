Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

#会員側
root to: 'home#top'
get "/about" => "home#about"

resource :users, only: [:show, :edit, :update]
 get "/users/quit" => "uers#quit"
 put "/users/hide" => "users#hide"
 get "/users/thank" => "users#thank"
resources :foods
resources :categories, only: [:new, :create, :index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#管理者側
namespace :admins do
	root to: "home#top"
	resources :users, only: [:index, :show, :edit, :update]
end

end
