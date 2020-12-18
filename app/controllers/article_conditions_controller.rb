class ArticleConditionsController < ApplicationController
  def index
    @article_conditions = ArticleCondition.order("created_at DESC")
  end

  def new
  end
end
