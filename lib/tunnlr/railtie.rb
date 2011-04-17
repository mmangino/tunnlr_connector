require 'tunnlr'
require 'rails'

module Tunnlr
  class Railtie < Rails::Railtie

    rake_tasks do
      Tunnlr.load_tasks
    end

  end
end