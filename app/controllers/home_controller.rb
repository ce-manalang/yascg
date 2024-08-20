class HomeController < ApplicationController
  def show
    @game = Game.new
  end
end  