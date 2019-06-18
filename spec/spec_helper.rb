require 'mongoid'
require 'mongoid-normalize-strings'

Mongoid.load!('spec/support/mongoid.yml', :test)

Mongoid.logger.level = Logger::ERROR
Mongo::Logger.logger.level = Logger::ERROR
