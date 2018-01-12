class Api::V1::CanvasesController < ApplicationController

  def index
    @canvases = Canvas.all

    render json: @canvases
  end

  # GET /canvases/1
  # GET /canvases/1.json
  def show
  end

  # GET /canvases/new
  def new
    @canvas = Canvas.new
  end

  # GET /canvases/1/edit
  def edit
  end

  # POST /canvases
  # POST /canvases.json
  def create
    @canvas = Canvas.create(params)
  end

end
