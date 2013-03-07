class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :original_url, :date_published, :date_ingested
end
