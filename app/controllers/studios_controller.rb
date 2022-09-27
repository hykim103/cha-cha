class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
  end
end
