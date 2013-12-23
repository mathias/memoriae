class Note
  @table_name = "notes"

  # Scopes
  def self.sorted_for_index
    note_hashes = r.table(@table_name).all.order_by(r.desc(:created_at)).run($rethinkdb)
    notes = note_hashes.map { |h| Note.new(h) }
  end

  def self.all
    query = r.table(@table_name)
    query
  end

  def initialize(attributes)
    attributes.each_pair do |

  end
end
