# desc "Explaining what the task does"
# task :tunnlr_connector do
#   # Task goes here
# end
desc "Create a tunnel"
namespace :tunnlr  do
  task :start => :environment do
    Tunnlr::Connector.new.connect!
  end
  task :configure => :environment do
    Tunnlr::Configurator.new.configure(File.join(RAILS_ROOT,"config","tunnlr.yml"))
  end
  task :ui => :environment do
    require 'tunnlr/ui'
    Tunnlr::Ui::MainApp.new.main_loop
  end
end