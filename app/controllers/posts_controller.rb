class PostsController < ApplicationController

        def index
        @ms=Message.all
        end 
end
