class NotesDecorator < Draper::CollectionDecorator
  delegate :new, :where, :update_all, :order
end
