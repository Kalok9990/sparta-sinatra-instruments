class InstrumentController < Sinatra::Base

  # sets root as the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :views, Proc.new{File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  $instruments = [{
    id: 0,
    name: "Piano",
    info: "This is a string instrument",
    image: "http://www.belfastmusic.co.uk/ekmps/shops/belfastmusic/images/v-piano-grand-1424-p.jpg"
  },
  {
    id: 1,
    name: "Trumpet",
    info: "This is a brass instrument",
    image: "https://images-na.ssl-images-amazon.com/images/I/41c90VJBDBL._SL500_AC_SS350_.jpg"
  },
  {
    id: 2,
    name: "Flute",
    info: "This is a wind instrument",
    image: "http://az632705.vo.msecnd.net/cmsroot/jupitermusic/media/jupiter-media/products/woodwinds/jaf1000e/angle1/jaf1000e_1.jpg"
  }]

  get "/" do
    @title = "Instuments Homepage"
    erb :"instruments/home"
  end

  get "/instruments" do
    @title = "Instruments"
    @instruments = $instruments
    erb :"instruments/index"
  end

  get "instruments/new" do
    @title = "New Instrument"
    erb :"instruments/new"
  end

  get "/instruments/:id" do
    id = params[:id].to_i
    @instrument = $instruments[id]
    erb :"instruments/show"
  end

  get "/instruments/:id/edit" do
    id = params[:id].to_i
    @instrument = $instruments[id]
    @title = "Edit instrument"
    erb :"instruments/edit"
  end
end
