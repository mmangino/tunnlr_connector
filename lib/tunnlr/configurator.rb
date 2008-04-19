require 'highline'
require 'net/ssh'
module Tunnlr
  class Configurator
    attr_accessor :not_configured,:email,:password
    def initialize
      @ui = HighLine.new
      @not_configured=true
    end
    
    def fetch(username,password)
      url=URI.parse('http://tunnlr.com/configuration.yml')
      req = Net::HTTP::Get.new(url.path)
      req.basic_auth(username,password)
      res = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req)
          }
      @configuration = res.body
    end
    
    def add_password
      @configuration.gsub!(/PASSWD/,password)
    end
    
    def write_config(path)
      open(path,"w+") do |f|
        f.puts(@configuration)
      end
    end
    
    def get_credentials
      puts "Enter the email address and password you used to sign up for Tunnlr."
      self.email = @ui.ask("Email: ") 
      self.password = @ui.ask("Password: ") { |q| q.echo = false }
      fetch(email,password)
    end
    
    def configure(path)
      while not_configured
        begin
          get_credentials
          fetch(email,password)
          add_password
          write_config(path)
          puts "Created configuration in #{path}"
          self.not_configured=false
        rescue Net::HTTPNotAcceptable=>e
          puts "Login failed, please try again"
        end
      end
    end
    
  end
end