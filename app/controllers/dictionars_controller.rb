class DictionarsController < ApplicationController

    def index
    @msql=Dictionar.all
    end



    def show
    @msql=Dictionar.find_by(_id:params[:id])
    #render plain: Dictionar.find(params[:id]).inspect 
    end

    def new

    end

    def update
        @msql=Dictionar.find_by(_id:params[:id])
        @msql.update(dictionar_params)
        redirect_to action: :index   # в место action: не понял что это, инициализировать новый запрос к браузеру, а какие еще бывают?  :index вьюха?
    end

    def destroy
        @msql=Dictionar.find_by(_id:params[:id])
        @msql.delete
        redirect_to action: :index
    end



    def edit
    @msql=Dictionar.find_by(_id:params[:id])
    end


    def create
        #render plain: params[:addmessage].inspect
        @temp=Dictionar.new(dictionar_params)
        @temp.save
        redirect_to action: :index   # в место action: не понял что это, инициализировать новый запрос к браузеру, а какие еще бывают?  :index вьюха?
    end

    private def dictionar_params
    params.require(:dictionar).permit(:ves, :word, :comment)
    end    
end
