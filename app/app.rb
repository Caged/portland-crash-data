require './app/env'
require './app/models'

get '/' do
  @crashes = Crash.pedestrians_and_cyclist.where("crash_dt >= '01/01/2013'")
  erb :index
end

get '/stats' do
  @crashes = Crash.cyclist.where("crash_dt >= '01/01/2013'")
  @participants = @crashes.map(&:participants).flatten
  @vehicles = @participants.map(&:vehicle).flatten

  @stats = {
    :movements => @vehicles.map(&:movement).flatten.group_by(&:mvmnt_long_desc),
    :causes => @participants.map(&:causes).flatten.group_by(&:description)
  }
  erb :stats
end

get '/crash/:id' do
  @crash = Crash.find(params[:id])
  erb :crash
end
