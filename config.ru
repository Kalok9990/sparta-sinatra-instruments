require "sinatra"
require "sinatra/reloader" if development?
require "pg"
require_relative "./models/instrument.rb"
require_relative "./controllers/instruments_controllers.rb"

use Rack::MethodOverride
run InstrumentController
