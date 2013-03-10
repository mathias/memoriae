class ArticleIngestWorker
  include Sidekiq::Worker

  def perform(article_id)
    article = Article.find(article_id)

    if article && article.new?
      ingest_article(article)
    end
  end

  private
  def ingest_article article
    if article.original_url.present?
      data = {}

      Timeout::timeout(10) {
        url = CGI.escape(article.original_url)
        response = HTTParty.get("#{ENV['WOLFCASTLE_URL']}?url=#{url}")
        data = JSON.parse(response.to_json)
      }

      unless data["error"] == true
        article.transaction do
          article.title = data["title"]
          article.body = data["html"].squish
          article.ingest!
          article.save!
        end
      end
    end
  end
end
