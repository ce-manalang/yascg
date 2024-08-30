class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:id])
    @cards = @game.cards.order(created_at: :asc)
    @card = @game.cards.find(@game.cards.pluck(:id).sample)
    cable_ready[:foo]
      .append("body", html: "They lay awake, wondering if there is a dog.")
      .broadcast
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