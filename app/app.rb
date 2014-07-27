require 'active_record'

set :root, File.dirname(__FILE__)

configure do

 ActiveRecord::Base.establish_connection(
   :adapter  => 'postgresql',
   :host     => 'localhost',
   :database => 'crashes',
   :port => 15432
 )

  ActiveRecord::Base.logger = ActiveSupport::Logger.new('db.log')
end

class Crash < ActiveRecord::Base
  self.primary_key = :crash_id
  self.table_name = :crash

  default_scope { order('crash_dt DESC') }

  has_many :participants, :join_table => :partic
  has_many :vehicles, :join_table => :vhcl


  scope :pedestrians, -> { where("crash_typ_cd = '3'") }
  scope :cyclist, -> { where("crash_typ_cd = '6'") }
  scope :pedestrians_and_cyclist, -> { where("crash_typ_cd in('3', '6')") }
end

class Participant < ActiveRecord::Base
  self.primary_key = :partic_id
  self.table_name  = :partic

  has_one :vehicle,
    :foreign_key => :vhcl_id,
    :primary_key => :vhcl_id
end

class Vehicle < ActiveRecord::Base
  self.primary_key = :vhcl_id
  self.table_name  = :vhcl

  alias_attribute :ownership, :vhcl_ownshp_short_desc
  alias_attribute :kind, :vhcl_typ_short_desc
end


get '/' do
  @crashes = Crash.pedestrians_and_cyclist.where("crash_dt >= '01/01/2013'")
  erb :index
end

get '/crash/:id' do
  @crash = Crash.find(params[:id])
  erb :crash
end
