class MessagesController < ApplicationController
    def allmessages
        @ms=Message.all
    end

    def new

    end

    def create
        render plain: params[:addmessage].inspect
    end

    private def message_params
    end

end
