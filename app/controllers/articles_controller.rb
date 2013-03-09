class ArticlesController < ApplicationController
  expose(:articles)
  expose(:article, attributes: :article_params)

  def create
    article.date_ingested ||= Time.now

    if article.save
      redirect_to(articles_path)
    else
      render :new
    end
  end

  def update
    if article.save
      redirect_to(articles_path)
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :date_published, :date_ingested)
  end
end
