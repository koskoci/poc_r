require 'sinatra/base'
require 'sinatra/json'

class Poc < Sinatra::Base
  get '/hello' do
    "Hello World"
  end

  get '/' do
    @host_name = request.env["SERVER_NAME"]
    @time = Time.now.strftime("%d/%m/%Y %H:%M")
    haml :start
  end

  post '/echo' do
    json JSON.parse(request.body.read)
  end
end
