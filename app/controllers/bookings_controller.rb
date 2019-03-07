class BookingsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy, :confirmation]

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
    @booking.status = "Upcoming"
    @booking.jet = @jet
    @booking.user = current_user
    @booking.status = 'Pending'
    if @booking.save
      redirect_to bookings_path
    else
      render jet_path(@jet)
    end
  end

  def edit
  end

  def update
    @booking.update(set_params)
    authorize @booking
    redirect_to bookings_path
  end

  def destroy
    @booking = set_params
    Booking.delete(@booking)
    authorize @booking
    redirect_to bookings_path
  end

  def confirm
    @booking = Booking.find(params[:format])
    @booking.status = 'Booked'
    @booking.save
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
