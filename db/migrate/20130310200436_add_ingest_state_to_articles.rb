class AddIngestStateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :ingest_state, :string, default: 'new'
  end
end
