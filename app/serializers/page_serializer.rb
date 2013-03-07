class PageSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :content_format
end
