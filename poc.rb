require 'sinatra/base'
require 'sinatra/json'
require 'redis'

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
    request.body.read
  end

  post '/keys' do
    body = JSON.parse(request.body.read)
    redis.set(body.keys.first, body.values.first)
  end

  get '/keys/:key' do
    key = params['key']
    value = redis.get(key)

    json key.to_sym => value
  end

  private

  def redis
    @_redis ||= Redis.new
  end
end
