class NotesController < ApplicationController
  expose(:note, attributes: :note_params) { find_or_new_note(params) }

  def index
    @notes = Note.sorted_for_index.run
  end

  def create
    note.title = params[:note][:title]
    note.body = params[:note][:body]

    if note.save
      redirect_to(note_path(note))
    else
      render :new
    end
  end

  def update
    note.title = params[:note][:title]
    note.body = params[:note][:body]

    if note.save
      redirect_to(note_path(note))
    else
      render :edit
    end
  end

  private
  def find_or_new_note(params)
    if params.has_key? :id
      Note.find(params[:id])
    else
      Note.new
    end

  end

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
