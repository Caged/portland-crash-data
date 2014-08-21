require './app/env'
require './app/models'

get '/' do
  @crashes = Crash.pedestrians_and_cyclist.where("crash_dt >= '01/01/2013'")
  erb :index
end

get '/crash/:id' do
  @crash = Crash.find(params[:id])
  erb :crash
end
