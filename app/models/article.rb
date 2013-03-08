class Article < ActiveRecord::Base
  has_many :notes
  validates_presence_of :title, :date_published, :date_ingested
  after_create :set_ingest_date

  def original_domain
    URI.parse(original_url).host if original_url
  end

  private

  def set_ingest_date
    self.date_ingested ||= Time.now
  end
end
