class NotesController < ApplicationController
  expose(:notes)
  expose(:note)
  expose(:sorted_notes) { notes.order('created_at DESC').decorate }
end
