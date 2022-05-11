class ProjectsController < ApplicationController

   require 'open-uri'
   require 'nokogiri'
   require 'open_uri_redirections'

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
@parser=""
@part=[]
@masslink=[]
@temp={}
=begin  #что бы не постоянно лезть в юлу, сохранил одну страницу
Selenium::WebDriver::Chrome.driver_path = "C:/ruby/parsert/parsert/chromedriver.exe"
driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://youla.ru/krasnoyarsk?attributes[term_of_placement][from]=-7%20days&attributes[term_of_placement][to]=now&attributes[sort_field]=date_published&q=%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%8B%D0%BD%D1%8C"
sleep(2)
2.times  do |t|
 @parser = driver.page_source
 
 # сохранили в файл с тестовыми данными содержимое браузера
 #File.open("C:/ruby/parsert/parsert/testdata/1.txt", 'w') { |file| file.write(@parser) }
 #что бы не постоянно лезть в юлу, сохранил одну страницу

 doc = Nokogiri::HTML(@parser)
 doc.xpath("/html/body/div/div/div/main/div/div/div/section/div/div/div/div/div/div/div/div").each do |anchor|
 @part << anchor
 end
 driver.execute_script("window.scrollTo(0, document.documentElement.scrollHeight);")
 sleep(2)
end
driver.quit
=end  #что бы не постоянно лезть в юлу, сохранил одну страницу

# удалить этот код и раскоменть выше
 @parser= File.read("C:/ruby/parsert/parsert/testdata/1.txt")
 doc = Nokogiri::HTML(@parser)

i=0 # для массива


 doc.xpath("/html/body/div/div/div/main/div/div/div/section/div/div/div/div/div/div/div/div").each do |anchor|
 @part << anchor 
=begin
  anchor.xpath(".//a[@target][@rel][@title][contains(@href, 'krasnoyarsk')]/@href").each do |a|
    
    @masslink << a
    @temp["url"]=a
    #render plain: Message.where(url: a).first
    #render plain: a.inspect
    #return
   if Message.where(url: a).first == nil
    @temp=Message.new(@temp)
    @temp.save
   end
   # сделай проверку если повторный элемент запиши в базу с другим параметром для проверки
  end
=end



@temp["url"]=anchor.xpath(".//a[@target][@rel][@title][contains(@href, 'krasnoyarsk')]/@href").first
@temp["head"]=anchor.xpath(".//a[@target][@rel][@title][contains(@href, 'krasnoyarsk')]/@title").first
a=anchor.xpath(".//a[@target][@rel][@title][contains(@href, 'krasnoyarsk')]//text()")

    begin                                           
    @temp["pr"]=a[1].to_i
    @masslink << a[1].to_i
    rescue Exception                                
    @temp["pr"]=-1                                      
    end           

#@masslink << (@temp["url"].to_s+@temp["head"].to_s+@temp["pr"].to_s)

  if Message.where(url: @temp["url"]).first == nil 
  @t=Message.new(@temp)    
  @t.save
  end


#@masslink << (a[0].to_s+a[1].to_s+a[2].to_s+a[3].to_s+a[4].to_s)


                                  




=begin
5.times do |m|
    begin                                           
    temp=temp+a[m]                                  
    rescue Exception                                
    temp=temp                                       
    end                                             
end
=end

 

i=i+1
end
# удалить этот код и раскоменть выше








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
