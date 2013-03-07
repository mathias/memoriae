class PagesController < ApplicationController
  expose(:pages)
  expose(:page)

  def index
    render json: pages
  end

  def show
    render json: page
  end
end
