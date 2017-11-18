class InstrumentController < Sinatra::Base

  # sets root as the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :views, Proc.new{File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  # $instruments = [{
  #   id: 0,
  #   name: "Piano",
  #   info: "This is a string instrument",
  #   image: "http://www.belfastmusic.co.uk/ekmps/shops/belfastmusic/images/v-piano-grand-1424-p.jpg"
  # },
  # {
  #   id: 1,
  #   name: "Trumpet",
  #   info: "This is a brass instrument",
  #   image: "https://images-na.ssl-images-amazon.com/images/I/41c90VJBDBL._SL500_AC_SS350_.jpg"
  # },
  # {
  #   id: 2,
  #   name: "Flute",
  #   info: "This is a wind instrument",
  #   image: "http://az632705.vo.msecnd.net/cmsroot/jupitermusic/media/jupiter-media/products/woodwinds/jaf1000e/angle1/jaf1000e_1.jpg"
  # }]

  get "/" do
    @title = "Instuments Homepage"
    @instrument = Instrument.all
    erb :"instruments/index"
  end

  get "/new" do
    @instrument = Instrument.new
    erb :"instruments/new"
  end

  get "/:id" do
    id = params[:id].to_i
    @instrument = Instrument.find(id)
    erb :"instruments/show"
  end

  post "/" do
    instrument = Instrument.new
    instrument.name = params[:name]
    instrument.info = params[:info]
    instrument.image = params[:image]
    instrument.save
    redirect "/"
  end

  put "/:id" do
    id = params[:id]
    instrument = Instrument.find(id)
    instrument.name = params[:name]
    instrument.info = params[:info]
    instrument.image = params[:image]
    instrument.save
    redirect "/"
  end

  delete "/:id" do
    id = params[:id].to_i
    Instrument.remove(id)
    redirect "/"
  end

  get "/:id/edit" do
    id = params[:id].to_i
    @instrument = Instrument.find(id)
    erb :"instruments/edit"
  end
end
