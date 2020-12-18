class ArticleCategoriesController < ApplicationController
  def index
    @article_categories = ArticleCategory.order("created_at DESC")
  end

  def new
  end
end
