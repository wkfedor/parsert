class DictionarsController < ApplicationController

    def index
    @msql=Dictionar.all
    end



    def show
    @msql=Dictionar.find_by(_id:params[:id])
    #render plain: Dictionar.find(params[:id]).inspect 
    end

    def new
    @mas=[]
    #@mas << ["Все",-1]
    @progect=Project.all.order('created_at ASC')
    @progect.each {|x| @mas << [x.name,x._id] }

    end

    def update
        @msql=Dictionar.find_by(_id:params[:id])
        @msql.update(dictionar_params)
        redirect_to action: :index   # в место action: не понял что это, инициализировать новый запрос к браузеру, а какие еще бывают?  :index вьюха?
    end

    def destroy
        #render plain: "destroy"
        #return
        @msql=Dictionar.find_by(_id:params[:id])
        @msql.delete
        redirect_to action: :index
    end



    def edit
    @msql=Dictionar.find_by(_id:params[:id])
    @y=[]
    @progect=Project.all.order('created_at ASC')
    @progect.each {|x| @y << [x.name,x._id] }
=begin
    @msql.dproject.map do |x|
         @y << ["Все",x] if x.to_i==-1
         @y << ["Выберите элементы",x] if x.to_s==""
         @y << [x,x] if x.to_s!=""
    end
=end

    #render plain:
    # return
    end


    def create
        #render plain: params[:addmessage].inspect
        @temp=Dictionar.new(dictionar_params)
        @temp.save
        redirect_to action: :index   # в место action: не понял что это, инициализировать новый запрос к браузеру, а какие еще бывают?  :index вьюха?
    end

    private def dictionar_params
    params.require(:dictionar).permit(:ves, :word, :comment, :dproject => [])
    end
end
