class NotesController < ApplicationController
  expose(:notes)
  expose(:note)

  def index
    render json: notes
  end

  def show
    render json: note
  end
end
