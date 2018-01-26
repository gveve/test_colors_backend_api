class Api::V1::ImagesController < ApplicationController
skip_before_action :authorized

  def index
    @images = Image.all
    
    render json: @images, include: :user
  end

  # GET /canvases/1
  # GET /canvases/1.json
  def show
  end

  # GET /canvases/new
  def new
    @image = Image.new
  end

  # POST /canvases
  # POST /canvases.json
  def create
    # byebug
    @image = Image.create(image_params)
    render json: @image
  end

  # GET /canvases/1/edit
  def edit
  end

  private
  def image_params
    params.require(:image).permit(:name, :img, :user_id)
  end
end
