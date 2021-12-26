class MessagesController < ApplicationController
    def allmessages
        @ms=Message.all
    end
end
