class ArticleDaysShipsController < ApplicationController
  def index
    @article_days_ships = ArticleDaysShip.order("created_at DESC")
  end

  def new
  end
end
