class ProjectsController < ApplicationController


  def index
     @msql=Project.all
     @msqld=Dictionar.all
     #params="61de8e938040180b24f74142"
     #render plain: Project.find_by(_id:params)

    #db.projects.find({_id:ObjectId("61de8e938040180b24f74142")})
  end

  def edit
    @msqld=Dictionar.all
    @project=Project.find_by(_id:params[:id])

    @a =[]
    @project.dictionars.each do |y|    # в переменной @a массив id словарей которые есть в проекте
    @a << "#{y["_id"]}"
    end

  end


  def update

    @project=Project.find_by(_id:params[:id])
    puts "------------------------"
    #puts @project.inspect
    puts  "project="
    puts params.require(:project).inspect   # работает
    puts "------------------------"
    puts  "dictionar="
    puts params.require(:dictionars).inspect   # работает
    puts "------------------------"
    @project.update(project_params)
    @project.update(project_params2)           # тут косяк!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

   #puts params.require(:project).inspect
    redirect_to action: :index
  end


  def create
    #@temp=Project.new({"name"=>"111","dictionars"=>[{"_id"=>"61de8e938040180b24f74142"},{"_id"=>"61dea70a8040180b24f74143"}]})
    @temp={}
    @temp["dictionars"]=[]
    project_params2.each do |x|
      #@temp["dictionars"] <<  {"_id"=>"ObjectId(\"#{x}\")"}
       @temp["dictionars"] << {:_id => BSON::ObjectId("#{x}")}
    end
    @temp["name"]=project_params["name"]
    #render plain: @temp   # вывести содержимое на экран не используя вьюху

    @temp=Project.new(@temp)
    @temp.save
  end



  def show
    @msql=Project.all
    @msqld=Dictionar.all
  end

  def new
=begin
    @temp={}
    @temp["name"]=1000
    @temp["dictionars"]=[]
    @temp["dictionars"] << {"_id"=>"61de8e938040180b24f74142"}
    @temp["dictionars"] << {"_id"=>"61de8e938040180b24f74141"}
=end
    @msqld=Dictionar.all
  end




  private def project_params
    params.require(:project).permit(:name)

  end

  private def project_params2
    params.require(:dictionars)
  end

end
