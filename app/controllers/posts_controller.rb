class PostsController < ApplicationController





        def index
                #User.all
                #User.all.each  do  |a|
                #        render plain: a.name.inspect
                #render plain: (User.first.location.inspect + User.first.inspect )
                 @ms=Message.all
                end


                #render plain: User.all.inspect



end