require './app/env'
require './app/models'

get '/' do
  @crashes = Crash.pedestrians_and_cyclist.
    where("crash_dt >= '01/01/2013'").
    order('trim(st_full_nm),trim(isect_st_full_nm) desc')
  erb :index
end

get '/stats' do
  erb :stats
end

get '/stats_data' do
  content_type :json

  cyclist_crashes = Crash.cyclist.where("crash_dt >= '01/01/2012'")
  pedestrian_crashes = Crash.pedestrians.where("crash_dt >= '01/01/2012'")
  cyclist_stats = generate_stats_for_crashes(cyclist_crashes)
  pedestrian_stats = generate_stats_for_crashes(pedestrian_crashes)

  stats = {
    :cyclist => cyclist_stats,
    :pedestrian => pedestrian_stats
  }

  stats.to_json
end

get '/crash/:id' do
  @crash = Crash.find(params[:id])
  erb :crash
end

def generate_stats_for_crashes(crashes)
  participants = crashes.map(&:participants).flatten
  vehicles = participants.map(&:vehicle).flatten

  movements = vehicles.map(&:movement).flatten.group_by(&:mvmnt_long_desc).map do |key, val|
    { :name => key, :count => val.count }
  end
  add_percents(movements)

  causes = participants.map(&:causes).flatten.group_by(&:description).map do |key, val|
    { :name => key, :count => val.count }
  end.select { |c| c[:name] != 'No cause associated at this level' }
  add_percents(causes)

  errors = crashes.map(&:errors).flatten.group_by(&:description).map do |key, val|
    { :name => key, :count => val.count }
  end
  add_percents(errors)

  events = crashes.map(&:events).flatten.group_by(&:description).map do |key, val|
    { :name => key, :count => val.count }
  end
  add_percents(events)

  sections = crashes.group_by(&:city_sect_nm).map do |key, val|
    { :name => key, :count => val.count }
  end
  add_percents(sections)

  streets = crashes.group_by { |c| c.st_full_nm.strip }.map do |key, val|
    { :name => key, :count => val.count }
  end
  add_percents(streets)

  intersecting_streets = crashes.group_by { |c| c.isect_st_full_nm.strip }.map do |key, val|
    { :name => key, :count => val.count }
  end
  add_percents(intersecting_streets)

  time_series = crashes.select('crash_dt, count(*)').group('crash_dt').order('crash_dt desc').to_a
  to = time_series.first.crash_dt
  to = Date.new(to.year, 12, 31)
  from = time_series.last.crash_dt
  from = Date.new(from.year, 1, 1)

  out = []
  (from.to_date..to.to_date).each do |date|
    entry = time_series.detect { |t| t.crash_dt.to_date === date }
    out << { :date => date, :count => (entry ? entry.count : 0) }
  end


  {
    :movements => movements,
    :causes => causes,
    :errors => errors,
    :events => events,
    :sections => sections,
    :streets => streets,
    :intersecting_streets => intersecting_streets
    # :time_series => out
  }
end

def add_percents(data)
  total = data.inject(0) { |sum,x| sum + x[:count] }
  data.each do |item|
    item[:percent] = (item[:count] / total.to_f * 100).floor
  end
end
