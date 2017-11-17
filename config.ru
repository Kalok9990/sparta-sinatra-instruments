require "sinatra"
require "sinatra/reloader" if development?
require_relative "./controllers/instruments_controllers.rb"

run InstrumentController
