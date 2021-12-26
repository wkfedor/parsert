Rails.application.routes.draw do
root 'posts#index'
get 'readmi'=>'pages#readmi'
get 'allmessages'=>'messages#allmessages'
end
