require_relative 'config/application'
require 'rom-sql'
require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    Application.start(:db)
    config = Application['db']
    config.gateways[:default].use_logger(Logger.new($stdout))
  end
end
