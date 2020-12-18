class ArticleDeliveryFeesController < ApplicationController
  def index
    @article_delivery_fees = ArticleDeliveryFee.order("created_at DESC")
  end

  def new
  end
end
