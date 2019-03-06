class JetsController < ApplicationController
  require 'date';
  before_action :set_jet, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @search = { address: params[:address], pax: params[:pax], start_date: params[:start_date], end_date: params[:end_date] }
    @jets = Jet.near(params[:address], 10).where("pax >= ?", params[:pax].to_i).where.not(latitude: nil, longitude: nil)
    @markers = @jets.map do |jet|
      {
        lng: jet.longitude,
        lat: jet.latitude
      }
    end
  end

  def show
    my_startdate = Date.parse(params[:start_date])
    my_enddate = Date.parse(params[:end_date])
    diff = my_enddate.mjd - my_startdate.mjd

    price = @jet.price_day * diff
    @booking = Booking.new(start_date: my_startdate, end_date: my_enddate, price_total: price, pax_booking: params[:pax])
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
    params.require(:jet).permit(:name, :description, :price_day, :pax, :address, :photo)
  end

  def set_jet
    @jet = Jet.find(params[:id])
  end

end
