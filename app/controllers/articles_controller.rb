class ArticlesController < ApplicationController
  expose(:articles) { Article.scoped.order('date_ingested DESC') }
  expose(:article, attributes: :article_params)

  def create
    article.date_ingested ||= Time.now
    article.body = params[:article][:body].squish

    if article.save
      redirect_to(articles_path)
    else
      render :new
    end
  end

  def update
    article.body = params[:article][:body].squish

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
    params.require(:article).permit(:title, :body, :date_published, :date_ingested, :original_url)
  end
end
