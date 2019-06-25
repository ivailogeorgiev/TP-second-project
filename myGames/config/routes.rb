Rails.application.routes.draw do
  resources :games
  get 'games/new'
  get 'games/create', to: "views#create"
	namespace 'api' do
		namespace 'v1' do
			resources :games
		end
	end
	post 'auth/login', to: 'authentication#authenticate'
	post 'signup', to: 'users#create'
end
