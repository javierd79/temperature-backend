class ArchivesController < ApplicationController
  def index
    @archives = Archive.all
    render json: @archives, status: :ok
  end

  def last
    @archive = Archive.last
    render json: @archive, status: :ok
  end
end
