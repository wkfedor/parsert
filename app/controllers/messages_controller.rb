class MessagesController < ApplicationController
    def allmessages
        #@ms=Message.all.sort_by(&:ves)
        @ms=Message.all.order('ves DESC')
    end



    def show
       @ms={"a" => 10, "b" => 101, "c" => 102, "d" => 103, "e" => 104}      
       #@ms=[1,2,3,4,5]      
       # render plain: Message.find(params[:id]).inspect
       #@msql=Message.find(params[:id])
       @msql=Message.find_by(_id:params[:id])
       #@msql=Message.where(:_id => BSON::ObjectId(params[:id])) #как сделать запрос в монгу из руби where
       #@msql=Message.where(params[:id])
       # я получил строку. как мне из нее получить массив? 
       #@mas=Array.new

       #@msql.as_json.each  do  |a, b|
       #@mas.push(a) ictionar.find_by(_id:params[:id])
       #end  
       #render plain: @msql["created_at"].inspect
       #render plain: @msql["_id"]
       #render plain: @mas
       #render plain: @msql.as_json.inspect
       #render plain: @msql.methods
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
