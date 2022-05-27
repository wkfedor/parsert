class ProjectsController < ApplicationController

  require 'open-uri'
  require 'nokogiri'
  require 'open_uri_redirections'

  def index
    @msql = Project.all
    @msqld = Dictionar.all
    #params="61de8e938040180b24f74142"
    #render plain: Project.find_by(_id:params)

    #db.projects.find({_id:ObjectId("61de8e938040180b24f74142")})
  end

  def edit
    @msqld = Dictionar.all
    @project = Project.find_by(_id: params[:id])

    @a = []
    @project.dictionars.each do |y| # в переменной @a массив id словарей которые есть в проекте
      @a << "#{y["_id"]}"
    end

  end


  def destroy
    Project.find_by(_id: params[:id]).delete
    redirect_to action: :index
  end


  def update
    @temp = {}
    @temp["dictionars"] = []
    @project = Project.find_by(_id: params[:id])
    @project.update(project_params)

    #@project.update(project_params2)

    project_params2.each do |x|
      @temp["dictionars"] << {:_id => BSON::ObjectId("#{x}")}
    end

    #render plain:  @temp.inspect
    @temp = Project.update(@temp)
    #@temp.save
    #puts params.require(:project).inspect
    redirect_to action: :index
  end


  def create
    @temp = {}
    @temp["dictionars"] = []
    project_params2.each do |x|
      @temp["dictionars"] << {:_id => BSON::ObjectId("#{x}")}
    end
    @temp["name"] = project_params["name"]
    @temp["masslink"] = project_params["masslink"]
    @temp["work"] = project_params["work"]
    #render plain: @temp   # вывести содержимое на экран не используя вьюху

    @temp = Project.new(@temp)
    @temp.save
    redirect_to action: :index
  end


  def show
    @msql = []
    @msql << Project.find_by(_id: params[:id])





    @msqld = Dictionar.all
    @parser = ""
    @part = []
    @masslink = []
    

    balans params[:id]
    return 

    #Project.find_by(_id:params[:id]).masslink.split(";").map(&:to_s) для каждого элемента вызываем to_s
    #Версия 96.0.4664.45  debian


    #тестируем новый функционал, расчет баланса
    #
    # --- в работу с messages при сохранении объявления первый раз добавить ссылку на id проекта
    # --- в работу с messages добавить  поле расчет веса
    # --- в работу с messages добавить  поле время когда был расчитан веес
    # --- в проекты добавить поле при каком весе выводит сообщения
    # --- в проекты добавить поле при какой цене выводить сообщения
    # ---- сообщения выводяться все но отсортированные по весу и по ценне, и есть подвал, там все что не прошли проверку в порядке убывания
    #balans
    #return
    #тестируем новый функционал, расчет баланса




    begin
      Selenium::WebDriver::Chrome.driver_path = "C:/ruby/parsert/parsert/chromedriver.exe"
    rescue Exception
      Selenium::WebDriver::Chrome.driver_path = Rails.root.to_s+"/chromedriver"
    end


    driver = Selenium::WebDriver.for :chrome

    Project.find_by(_id: params[:id]).masslink.split(";").map(&:to_s).each do |link|

      driver.navigate.to link
      sleep(2)

      driver.execute_script("window.scrollTo(0, document.documentElement.scrollHeight);")
      sleep(2)

      @parser = driver.page_source

      doc = Nokogiri::HTML(@parser)

      #doc.xpath("/html/body/div/div/div/main/div/div/div/section/div/div/div/div/div/div/div/div").each do |anchor|
      doc.xpath(".//div[@data-test-component][@class]/div/span").each do |anchor|
        @part << anchor
        @t = {}
        @t["open"] = false
        @t["mainproject"] = []
        @t["mainproject"] << {:_id => BSON::ObjectId("#{params[:id]}")}
      
        
        

        @t["url"] = anchor.xpath(".//a[@target][@rel][@title][contains(@href, 'krasnoyarsk')]/@href").first
        @t["head"] = anchor.xpath(".//a[@target][@rel][@title][contains(@href, 'krasnoyarsk')]/@title").first
        a = anchor.xpath(".//a[@target][@rel][@title][contains(@href, 'krasnoyarsk')]//text()")

        begin
          @t["pr"] = a[1].text.scan(/\w+/).join.to_i
            #@masslink << a[1].text.scan(/\w+/).join.to_i
        rescue Exception
          @t["pr"] = -1
        end

        #@masslink << (@temp["url"].to_s+@temp["head"].to_s+@temp["pr"].to_s)

        if Message.where(url: @t["url"]).first == nil
          @tn = Message.new(@t)
          @tn.save
        end
      end
    end
    driver.quit
    # удалить этот код и раскоменть выше

    podrobno




  end


  def balans a

    temp=''

    massdictionars={}
    Project.find_by(_id:a).dictionars.each do |x| #перебираем все словари в проекте
    dictionars = Dictionar.find_by(x)
    massdictionars[dictionars.word]=dictionars.ves
    end
    
    Message.where({mainproject:{_id:BSON::ObjectId("#{a}")}}).each do |y|
    
     str=(y.head&.downcase&.to_s || "")+(y.text&.downcase&.to_s || "")

     massdictionars.each_with_index do |val, index|
      if str.include? val[0]
       puts "String includes 'cde'"
      end
      #temp=temp+massdictionars[val[index]].to_s+"\t\r"
     temp=temp+val[0]+"\t\r"
     end
         
     
    end 

    #render plain: 'запускаем механизм подсчета веса объявления'+ massdictionars.inspect
    render plain: 'запускаем механизм подсчета веса объявления'+ temp
    return
  end


  def podrobno
#1 отдельный процесс, нужно 2 раза открывать закрывать барузер
#2 из плюсов сейчас удобно будет отлаживать
#3 постораться переделать парсер так что бы браузер открывался 1 раз в процессе работы
    begin
      Selenium::WebDriver::Chrome.driver_path = "C:/ruby/parsert/parsert/chromedriver.exe"
    rescue Exception
      Selenium::WebDriver::Chrome.driver_path = Rails.root.to_s+"/chromedriver"
    end
    driver = Selenium::WebDriver.for :chrome
    Message.where(open: false).not(url: nil).each do |m|
#render plain: m.id.to_s+m.url.to_s
#return
      driver.navigate.to "https://youla.ru" + m.url.to_s
      sleep(2)
      pagesourse = driver.page_source
      doc = Nokogiri::HTML(pagesourse)
      anchor = doc.xpath(".//dd//p//text()")

      messages = Message.find_by(_id: m.id)
      #render plain: messages.inspect
      #
      messages.update(text: anchor, open: 'true')
    end
    driver.quit
  end


  def new
    @msqld = Dictionar.all
  end


  private def project_params
    params.require(:project).permit(:name, :masslink, :work)

  end

  private def project_params2
    begin # аналог try catch
      params.require(:dictionars) # аналог try catch
    rescue Exception # аналог try catch
      ["6268c61f80401826b7a04038"] # аналог try catch
    end # аналог try catch
  end

end
