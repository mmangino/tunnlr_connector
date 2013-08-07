require 'tunnlr/connector'
require 'tunnlr/configurator'

module Tunnlr 
  puts 'Loaded'
  def self.load_tasks
    Dir[File.expand_path("tasks/*.rake", File.dirname(__FILE__))].each { |ext| load ext }
  end

  require 'tunnlr/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
  
end
