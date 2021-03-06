require 'nokogiri'
require 'open-uri'

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :fetch_session, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present? && params[:search][:neighborhood].present?
      @sessions = policy_scope(Session.geocoded.near(params[:search][:neighborhood], 5)).select { |session| session.date.to_date >= DateTime.now.to_date}

      if @sessions.length == 0
        @no_sessions = true
        @sessions = policy_scope(Session.geocoded).select { |session| session.date.to_date >= DateTime.now.to_date}
      end

    else
      @sessions = policy_scope(Session.geocoded).select { |session| session.date.to_date >= DateTime.now.to_date}
    end


    @markers = @sessions.map do |session|
      {
        lat: session.latitude,
        lng: session.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { session: session }),
        image_url: 'https://res.cloudinary.com/dl5weozhw/image/upload/v1582735986/avatar_zjp30z.png'
      }
    end
  end

  def show
    @session = Session.find(params[:id])
    authorize @session
  end

  def new
    @session = Session.new
    authorize @session
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user
    url = "http://www.omdbapi.com/?t=#{@session.movie}&apikey=adf1f2d7"
    page = Nokogiri::HTML(open(url).read)
    result =  JSON.parse(page)
    @session.description = result["Plot"]
    @session.picture_url = result["Poster"]

    authorize @session

    if @session.save
      redirect_to dashboard_bookings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @session.update(session_params) # true / false
      redirect_to @session, notice: 'Your new movie session was successfully updated.'
    else
      render :edit
    end

  end

  def destroy
    if @session.bookings.length == 0
      @session.destroy
      redirect_to sessions_path, notice: 'Session was successfully destroyed.'
    else
      redirect_to session_path(@session), alert: "You can't delete a session that has bookings!"
    end
  end

  private

  def session_params
    params.require(:session).permit(:movie, :neighborhood, :address, :date, :capacity, :price)
  end

  def fetch_session
    @session = Session.find(params[:id])
    authorize @session
  end

end
