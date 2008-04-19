require 'wx'
module Tunnlr
  class Ui < Wx::App
    def on_init  # we're defining what the application is going to do when it starts
      t = Wx::Timer.new(self, 55)
      evt_timer(55) { Thread.pass }
      t.start(100)
      
      helloframe = Wx::Frame.new(nil, -1, "Tunnlr")  # it's going to make a frame entitled "Hello World"
      @tunnlr=Tunnlr::Connector.new

      @start = Wx::Button.new(helloframe,-1,"Start Tunnel")
      @stop = Wx::Button.new(helloframe,-1,"Stop Tunnel")
      @start.evt_button(@start.id) do |event| 
        Thread.new do
          begin
            @tunnlr.connect! 
          rescue Exception => e
            puts e
          end
       end
       @start.hide()
       @stop.show()
       
      end
      
      @stop.evt_button(@stop.id) do |event|
        @tunnlr.disconnect!
        @stop.hide()
        @start.show()
      end
      @start.show()
      @stop.hide()
      
      helloframe.show()  # and then it's going to make the window appear
    end
  end
end