Rails.application.routes.draw do
root 'posts#index'
get 'readmi'=>'pages#readmi'
get 'allmessages'=>'messages#allmessages'

resources :messages
# rake routes показать все url адреса которые отслеживаем
end
