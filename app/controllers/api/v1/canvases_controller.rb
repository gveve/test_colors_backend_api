class Api::V1::CanvasesController < ApplicationController
  skip_before_action :authorized

  def index
    @canvas = Canvas.all

    render json: @canvas
  end

  # GET /canvases/1
  # GET /canvases/1.json
  def show
  end

  # GET /canvases/new
  def new
    @canvas = Canvas.new
  end

  # POST /canvases
  # POST /canvases.json
  def create
    # byebug
    @canvas = Canvas.create(canvas_params)
  end

  # GET /canvases/1/edit
  def edit
  end

  private
  def canvas_params
    params.require(:canvases).permit(:name, :img)
  end

end
