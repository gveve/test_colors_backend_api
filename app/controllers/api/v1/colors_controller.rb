class Api::V1::ColorsController < ApplicationController

  # GET /colors
  # GET /colors.json
  def index
    @colors = Color.all

    render json: @colors
  end

  # GET /colors/1
  # GET /colors/1.json
  def show
  end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # GET /colors/1/edit
  def edit
  end

  # POST /colors
  # POST /colors.json
  def create
    @color = Color.create(params)
  end

end
