class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.create
    redirect_to game_path(@game)
  end

  def join
    @game = Game.find(params[:id])
    if @game
      redirect_to game_path(@game)
    end
  end
end