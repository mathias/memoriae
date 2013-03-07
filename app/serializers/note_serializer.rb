class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :article_id
end
