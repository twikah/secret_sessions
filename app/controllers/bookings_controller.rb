class BookingsController < ApplicationController
  before_action :fetch_session, except: [:dashboard, :show]

  def index
    @bookings = Booking.all
    # @bookings = Booking.where(published: true)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(dose_params)
    @booking.session = @session
    if @booking.save
      redirect_to session_path(@booking.session)
    else
      render :new
    end

    def show
      @booking = Booking.find(params[:id])
    end

    def dashboard
      @booking = Booking.where(user: current_user)
    end

  end


  private

  def booking_params
    params.require(:booking).permit(:quantity, :total)
  end

  def fetch_session
    @session = Session.find(params[:session_id])
  end

end
