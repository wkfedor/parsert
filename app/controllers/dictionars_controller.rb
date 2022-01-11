class DictionarsController < ApplicationController

    def index

    end 

    def show
    @msql=Dictionar.find_by(_id:params[:id])  
    #render plain: Dictionar.find(params[:id]).inspect 
    end

    def new

    end

    def create
        #render plain: params[:addmessage].inspect
        @temp=Dictionar.new(dictionar_params)
        @temp.save
        redirect_to @temp
    end

    private def dictionar_params
    params.require(:adddictionar).permit(:ves, :word, :comment)
    end    
end
