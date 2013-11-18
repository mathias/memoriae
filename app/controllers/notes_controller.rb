class NotesController < ApplicationController
  expose(:notes)
  expose(:note, attributes: :note_params)
  expose(:sorted_notes) { notes.order('created_at DESC').decorate }

  def create
    if note.save
      redirect_to(note_path(note))
    else
      render :new
    end
  end

  def update
    if note.save
      redirect_to(note_path(note))
    else
      render :edit
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
