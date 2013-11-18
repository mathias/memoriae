class Article < ActiveRecord::Base
  include AASM

  after_create :ingest_article

  aasm column: 'ingest_state' do
    state :new, initial: true
    state :ingested

    event :ingest, after: :set_date_ingested do
      transitions from: :new, to: :ingested
    end
  end

  def original_domain
    URI.parse(original_url).host if original_url
  end

  private
  def ingest_article
    ArticleIngestWorker.perform_async(self.id)
  end

  def set_date_ingested
    self.update_attributes(date_ingested: DateTime.now)
  end
end
