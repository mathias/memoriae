class ArticlesController < ApplicationController
  expose(:articles) { Article.scoped.order('date_ingested DESC') }
  expose(:article, attributes: :article_params)

  def new
    if params.has_key?("url")
      article.original_url = params["url"]
    end
  end

  def create
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

  def destroy
    article.destroy
    redirect_to(articles_path)
  end

  private

  def article_params
    params.require(:article).permit(:original_url)
  end
end
