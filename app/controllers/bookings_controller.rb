require 'byebug'

class BookingsController < ApplicationController

  before_action :fetch_session, except: [:dashboard, :show]

  def index
    @bookings = @session.bookings
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
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def dashboard
    @bookings = Booking.where(user: current_user) # sessions booked by current user
    @sessions = Session.where(user: current_user) # sessions created by current user

    # @grouped_sessions = @sessions.group_by { |session| session.date.to_date == DateTime.now.to_date }
    @past = @sessions.select { |session| session.date.to_date < DateTime.now.to_date}
    @upcoming = @sessions.select { |session| session.date.to_date >= DateTime.now.to_date}
  end

  private

  def booking_params
    params.require(:booking).permit(:quantity, :total)
  end

  def fetch_session
    @session = Session.find(params[:session_id])
  end
end
