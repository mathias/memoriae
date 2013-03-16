class ArticlesController < ApplicationController
  expose(:articles)
  expose(:article, attributes: :article_params)
  expose(:sorted_articles) { articles.order('created_at DESC').decorate }

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
      redirect_to(article_path(article))
    else
      render :edit
    end
  end

  def destroy
    article.destroy
    redirect_to(articles_path)
  end

  def mark_all_as_read
    articles.update_all(read: true)
    redirect_to(articles_path)
  end

  private

  def article_params
    params.require(:article).permit(:original_url, :read)
  end
end
