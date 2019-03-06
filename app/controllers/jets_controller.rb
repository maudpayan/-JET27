class JetsController < ApplicationController
  before_action :set_jet, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @search = { city: params[:city], pax: params[:pax], start_date: params[:start_date], end_date: params[:end_date] }
    @jets = Jet.where(city: params[:city]).where("pax >= ?", params[:pax].to_i)
  end

  def show
    @booking = Booking.new
  end

  def new
    @jet = Jet.new
  end

  def create
    @jet = Jet.new(jet_params)
    @jet.user = current_user
    if @jet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @jet.update(jet_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @jet.destroy
    redirect_to user_path(current_user)
  end

private

  def jet_params
    params.require(:jet).permit(:name, :description, :price_day, :pax, :city, :address, :zip, :photo)
  end

  def set_jet
    @jet = Jet.find(params[:id])
  end
end
