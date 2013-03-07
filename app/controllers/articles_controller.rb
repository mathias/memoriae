class ArticlesController < ApplicationController
  expose(:articles)
  expose(:article)

  def index
    render json: articles
  end

  def show
    render json: article
  end
end
