class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.text :original_url
      t.datetime :date_published
      t.datetime :date_ingested

      t.timestamps
    end
  end
end
