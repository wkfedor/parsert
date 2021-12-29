class MessagesController < ApplicationController
    def allmessages
        @ms=Message.all
    end


    def show
        @ms=Message.find(params[:id])
    end

    def new

    end

    def create
        #render plain: params[:addmessage].inspect
        @temp=Message.new(message_params)
        @temp.save
        redirect_to @temp
    end

    private def message_params
    params.require(:addmessage).permit(:url, :head, :pr, :text,  :link, :linksx, :dictionary, :photo, :phone)
    end

end
