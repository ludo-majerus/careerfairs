Careerfairs::Application.routes.draw do

  resources :guests

  resources :sites
  resources :pages

  resources :events do
    resources :stands
    resources :guests , :only => [:create, :index, :new]
    resources :companies, :only => [:index]
    match 'documents' => 'events#documents'
  end

  resources :contacts
  
  resources :companies do
    resources :contacts
  end


  match 'companytoevents/list' => 'companytoevents#list', :as => 'companytoevents_list'
  resources :companytoevents

  resources :companytoevents do
    resources :badges
    resources :jobs
    resources :events
  end

  resources :badges, :only => [:destroy, :update]
  resources :jobs, :only => [:destroy, :update]
  resources :stands, :only => [:destroy, :update]

  match 'sessions/logout' => 'sessions#logout'
  match 'sessions/new' => 'sessions#login'
  match 'sessions' => 'sessions#create', :via => :post  
  match 'sessions/:contact_id/become' => 'sessions#become#:contact_id', :via => :get, :as => :become_contact

  root :to => 'events#index'
end
