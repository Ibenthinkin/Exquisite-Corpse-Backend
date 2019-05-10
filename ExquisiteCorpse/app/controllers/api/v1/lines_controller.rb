class Api::V1::LinesController < ApplicationController
    before_action :find_line, only: [:show, :edit, :update, :destroy]

  def index
    @lines = Line.all
    render json: @lines
  end

  def update
    @line.update(line_params)
    if @line.save
      render json: @line, status: :accepted
    else
      render json: { errors: @line.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def destroy
   @line.delete
  end

  def create
    @line = Line.new(line_params)
    if @line.save
      render json: @line, status: :accepted
    else
      render json: { errors: @line.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def show
    @line = Line.find(params[:id])
    render json: @line, status: :accepted
  end


  def new
    @line = Line.new
  end

  private

  def line_params
    params.permit(:content, :author, :color, :corpse_id)
  end

  def find_line
    @line = Line.find(params[:id])
  end
end
