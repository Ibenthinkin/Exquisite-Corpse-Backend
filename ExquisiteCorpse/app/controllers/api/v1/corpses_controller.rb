class Api::V1::CorpsesController < ApplicationController
    before_action :find_corpse, only: [:update]
  def index
    @corpses = Corpse.all
    render json: @corpses
  end

  def update
    @corpse.update(corpse_params)
    if @corpse.save
      render json: @corpse, status: :accepted
    else
      render json: { errors: @corpse.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def destroy
   @corpse.delete
  end

  def create
    @corpse = Corpse.new(corpse_params)
    if @corpse.save
      render json: @corpse, status: :accepted
    else
      render json: { errors: @corpse.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def show
    @corpse = Corpse.find(params[:id])
    render json: @corpse
  end


  def new
    @corpse = Corpse.new
  end




  private

  def corpse_params
    params.permit(:title, :imageURL)
  end

  def find_corpse
    @corpse = Corpse.find(params[:id])
  end
end
