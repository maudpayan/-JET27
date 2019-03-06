class BookingsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @my_bookings = current_user.jets.map(&:bookings).flatten
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @jet = Jet.find(params[:jet_id])
    @booking = Booking.new(booking_params)
    @booking.jet = @jet
    @booking.user = current_user
    @booking.status = 'Booked'
    if @booking.save
      redirect_to 'pages#home'
    else
      render bookings_path
    end
  end

  def edit
  end

  def update
    @booking.update(set_params)
    redirect_to bookings_path
  end

  def destroy
    @booking.delete
    redirect_to bookings_path
  end

  private

  def set_params
    Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price_total)
  end
end
