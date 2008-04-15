require 'yaml'

module Tunnlr
  module Connector
    COMMAND_T = "ssh -nNt -g -R :%s:0.0.0.0:%s %s@%s"
    PIDFILE = File.join(RAILS_ROOT, "log/tunnlr.pid")
    
    module_function
    
    def connect!
      y make_command_string(read_configuration) and return
      if pid = fork { exec(make_command_string(read_configuration)) }
        write_pidfile(pid)
        Process.detach(pid)
      end
    end
    
    def disconnect!
      pid = File.read(PIDFILE).to_i
      unless pid.zero?
        Process.kill("HUP", pid)
      end
    end
    
    def read_configuration
      path = File.join(RAILS_ROOT, "config/tunnlr.yml")
      YAML.load(File.read(path))
    end
    
    def make_command_string(opts)
      COMMAND_T % [*opts.values_at(*%w[remote_port local_port user host])]
    end
    
    def write_pidfile(pid)
      path = File.join(PIDFILE)
      open(path) { |f| f.write(pid.to_s) }
    end
  end
end
