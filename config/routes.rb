Rails.application.routes.draw do
root 'posts#index'
get 'readmi'=>'pages#readmi'
get 'allmessages'=>'messages#allmessages'


get 'dictionars'=>'dictionars#'


resources :messages
resources :dictionars
# rake routes показать все url адреса которые отслеживаем

end
