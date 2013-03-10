class Article < ActiveRecord::Base
  include AASM

  has_many :notes

  aasm column: 'ingest_state' do
    state :new, initial: true
    state :ingested

    event :ingest do
      transitions from: :new, to: :ingested
    end
  end

  def original_domain
    URI.parse(original_url).host if original_url
  end
end
