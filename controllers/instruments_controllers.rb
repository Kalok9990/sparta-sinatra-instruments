class InstrumentController < Sinatra::Base

  # sets root as the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :views, Proc.new{File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

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
