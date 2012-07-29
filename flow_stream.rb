require 'sinatra'
require 'rack/utils'
helpers do
    include Rack::Utils
      alias_method :h, :escape
end

get "/" do
  erb :index
end


