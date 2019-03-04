class JetsController < ApplicationController
  before_action :set_jet, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @jets = Jet.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @jet = Jet.new
  end

  def create
    @jet = Jet.new(jet_params)
    @jet.save
    redirect_to jets_path
  end

  def edit
  end

  def update
    @jet.update(jet_params)
    redirect_to jet_path(@jet.id)
  end

  def destroy
    @jet.destroy
    redirect_to jets_params
  end

private

  def jet_params
    params.require(:jet).permit(:name, :description, :price_day, :pax, :city, :address, :zipcode)
  end

  def set_jet
    @jet = Jet.find(params[:id])
  end
end
