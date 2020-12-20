Rails.application.routes.draw do
  resources :groups do
    resources :group_has_pics
    # get "/pic/new", to: "group_has_pics#new"
  end
  post "group/assign-manager", to: "groups#assignManager"
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
