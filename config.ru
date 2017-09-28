require 'sinatra'
require 'sinatra/reloader' if development?

require_relative './controllers/player_controller.rb'

use Rack::MethodOverride

run PlayerController