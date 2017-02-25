Rails.application.routes.draw do
 resources :properties, except: [:destroy, :update]
end
