Subscriber::Application.routes.draw do
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :recipients
  
  controller :recipients do
    post 'notify' => :notify
  end
  
  root :to => 'recipients#new', as: 'new_recipient'
end
