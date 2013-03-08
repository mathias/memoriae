class Article < ActiveRecord::Base
  has_many :notes
  validates_presence_of :title, :date_published, :date_ingested

  def original_domain
    URI.parse(original_url).host if original_url
  end
end
