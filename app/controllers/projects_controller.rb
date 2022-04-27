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


  def destroy
    Project.find_by(_id:params[:id]).delete
    redirect_to action: :index
  end



  def update
    @temp={}
    @temp["dictionars"]=[]
    @project=Project.find_by(_id:params[:id])
    @project.update(project_params)

    #@project.update(project_params2)

    project_params2.each do |x|
      @temp["dictionars"] << {:_id => BSON::ObjectId("#{x}")}
    end

    #render plain:  @temp.inspect
    @temp=Project.update(@temp)
    #@temp.save
   #puts params.require(:project).inspect
    redirect_to action: :index
  end


  def create
    @temp={}
    @temp["dictionars"]=[]
    project_params2.each do |x|
        @temp["dictionars"] << {:_id => BSON::ObjectId("#{x}")}
    end
    @temp["name"]=project_params["name"]
    @temp["masslink"]=project_params["masslink"]
    @temp["work"]=project_params["work"]
    #render plain: @temp   # вывести содержимое на экран не используя вьюху

    @temp=Project.new(@temp)
    @temp.save
    redirect_to action: :index
  end



  def show
    @msql=[]
    @msql << Project.find_by(_id:params[:id])
    #render plain: @msql.inspect
    @msqld=Dictionar.all
  end

  def new
    @msqld=Dictionar.all
  end




  private def project_params
    params.require(:project).permit(:name,:masslink,:work)

  end

  private def project_params2
    begin                                           # аналог try catch
      params.require(:dictionars)                   # аналог try catch
    rescue Exception                                # аналог try catch
      ["6268c61f80401826b7a04038"]                  # аналог try catch
    end                                             # аналог try catch
  end

end
