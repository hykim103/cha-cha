class DanceClassesController < ApplicationController
  def home
  end

  def index
    if params[:query].present?
      @dance_classes = DanceClass.where("city ILIKE ?", "%#{params[:query]}%")
    else
      @dance_classes = DanceClass.all
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
