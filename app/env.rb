require 'rubygems'
require 'bundler'

Bundler.require

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
