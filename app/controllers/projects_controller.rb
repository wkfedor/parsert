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
    @temp=Project.new({"name"=>"111","dictionars"=>[{"_id"=>"61de8e938040180b24f74142"},{"_id"=>"61dea70a8040180b24f74143"}]})
    #puts "------------------------"
    #puts  "project_params="
    #puts  project_params.inspect
    @temp.save
  end



  def show
    @msql=Project.all
    @msqld=Dictionar.all
  end

  def new
    @msqld=Dictionar.all
  end




  private def project_params
    params.require(:project).permit(:name)

  end

  private def project_params2
    params.require(:dictionars).permit(:body)
  end

end
