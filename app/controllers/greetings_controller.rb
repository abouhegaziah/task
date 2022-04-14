class GreetingsController < ApplicationController
  def hello
    @message = "Hello World!"
    @message.upcase!
  end
end
