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

     # для тестирования открыть url вывести его  содержимое на экран
     #html = open("https://youla.ru/omsk/hehndmejd/oformlenie-interera")
     #@parser = html #Nokogiri::HTML html
     # @parser=[]
     #@parser.css('.sc-iyePXt gTvbKv').map do |showing|
     # @parser << showing 
     #end
#require 'rubygems'
#require 'capybara/cucumber'

#require 'rubygems'
#require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path = "C:/ruby/parsert/parsert/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.navigate.to "https://youla.ru/krasnoyarsk?attributes[term_of_placement][from]=-7%20days&attributes[term_of_placement][to]=now&attributes[sort_field]=date_published&q=%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%8B%D0%BD%D1%8C"
@parser=""
@part=[]
sleep(2)

2.times  do |t|
 @parser = driver.page_source
 doc = Nokogiri::HTML(@parser)
 doc.xpath("/html/body/div/div/div/main/div/div/div/section/div/div/div/div/div/div/div/div").each do |anchor|
 @part << anchor
 end
 driver.execute_script("window.scrollTo(0, document.documentElement.scrollHeight);")
 sleep(2)
end



#driver.execute_script("window.scrollTo(0, document.documentElement.scrollHeight);")
#sleep(2)
#@parser =@parser + driver.page_source

#doc.xpath("/html/body/div[2]/div[1]/div[4]/main/div/div[2]/div/section/div[4]/div[2]/div/div/div/div/div/div").each do |anchor|

#driver.manage.window.resize_to(800, 800)
#driver.save_screenshot "screenshot.png"

=begin
driver.navigate.to "http://google.com"
element = driver.find_element(name: 'q')
element.click
element.send_keys "Hello WebDriver!"
element.submit
=end

#@parser= element


driver.quit



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
