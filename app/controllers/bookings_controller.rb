class BookingsController < ApplicationController
  skip_after_action :verify_authorized, only: :dashboard
  before_action :fetch_session, except: [:dashboard, :show]

  def index
    # @bookings = policy_scope(Booking)
    @bookings = policy_scope(@session.bookings)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.session = @session
    @booking.user = current_user
    @booking.total = @session.price * booking_params[:quantity].to_i
    authorize @booking

    if @booking.save
      @session.capacity -= booking_params[:quantity].to_i
      @session.save!
      flash[:notice] = 'Booking successfully paid! Click on the session for details'
      redirect_to dashboard_bookings_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def dashboard
    @sessions_booked = Session.joins(:bookings).where(bookings: { user: current_user }).order(:date) # sessions booked by current user
    @sessions = Session.where(user: current_user).order(:date) # sessions created by current user

    @past = @sessions_booked.select { |session| session.date.to_date < DateTime.now.to_date}
    @upcoming = @sessions_booked.select { |session| session.date.to_date >= DateTime.now.to_date}
  end

  private

  def booking_params
    params.require(:booking).permit(:quantity)
  end

  def fetch_session
    @session = Session.find(params[:session_id])
  end
end
