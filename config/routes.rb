Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'emails/fetch', to: 'emails#fetch_emails'
      post 'emails/send', to: 'emails#send_email'
    end
  end
end
