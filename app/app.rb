require './app/env'
require './app/models'

get '/' do
  @crashes = Crash.pedestrians_and_cyclist.where("crash_dt >= '01/01/2013'")
  erb :index
end

get '/stats' do
  erb :stats
end

get '/stats_data' do
  content_type :json

  cyclist_crashes = Crash.cyclist.where("crash_dt >= '01/01/2012'")
  cyclist_participants = cyclist_crashes.map(&:participants).flatten
  cyclist_vehicles = cyclist_participants.map(&:vehicle).flatten

  pedestrian_crashes = Crash.pedestrians.where("crash_dt >= '01/01/2012'")
  pedestrian_participants = pedestrian_crashes.map(&:participants).flatten
  pedestrian_vehicles = pedestrian_participants.map(&:vehicle).flatten

  movements = cyclist_vehicles.map(&:movement).flatten.group_by(&:mvmnt_long_desc).map do |key, val|
    { :name => key, :count => val.count }
  end

  causes = cyclist_participants.map(&:causes).flatten.group_by(&:description).map do |key, val|
    { :name => key, :count => val.count }
  end

  types = cyclist_vehicles.group_by(&:vhcl_typ_cd).map do |key, val|
    [key, val.count]
  end

  pedestrian_movements = pedestrian_vehicles.map(&:movement).flatten.group_by(&:mvmnt_long_desc).map do |key, val|
    { :name => key, :count => val.count }
  end

  pedestrian_causes = pedestrian_participants.map(&:causes).flatten.group_by(&:description).map do |key, val|
    { :name => key, :count => val.count }
  end

  pedestrian_types = pedestrian_vehicles.group_by(&:vhcl_typ_cd).map do |key, val|
    [key, val.count]
  end

  stats = {
    :cyclist => {
      :movements => movements,
      :causes => causes,
      :vehicles => types
    },
    :pedestrian => {
      :movements => pedestrian_movements,
      :causes => pedestrian_causes,
      :types => pedestrian_types
    }
  }

  stats.to_json
end

get '/crash/:id' do
  @crash = Crash.find(params[:id])
  erb :crash
end
