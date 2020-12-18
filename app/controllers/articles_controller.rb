class ArticlesController < ApplicationController
  def def index
    @articles = Article.order("created_at DESC")
  end

  
end
