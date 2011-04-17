namespace :tunnlr  do
  
  desc "Create a tunnel"
  task :start => :environment do
    Tunnlr::Connector.new.connect!
  end
  
  desc "Write the tunnlr.yml file to your apps config directory"
  task :configure => :environment do
    Tunnlr::Configurator.new.configure(File.join(Rails.root,"config","tunnlr.yml"))
  end

  desc "Tunnlr UI requires the rubywx library"
  task :ui => :environment do
    require 'tunnlr/ui'
    Tunnlr::Ui::MainApp.new.main_loop
  end
end