class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :fetch_session, only: [:show, :edit, :update, :destroy]

  def index
    @sessions = Session.all
    # @sessions = Session.geocoded

    @markers = @sessions.map do |session|
      {
        lat: session.latitude,
        lng: session.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { session: session }),
        image_url: helpers.asset_url('avatar')
      }
    end
  end

  def show
    @sessions = Session.find(params[:id])
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    if @session.save
      redirect_to @session
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
    @session.destroy
    redirect_to sessions_url, notice: 'Session was successfully destroyed.'
  end

  private

  def session_params
    params.require(:session).permit(:movie, :neighborhood, :address,
      :description, :date, :capacity, :price)
  end

  def fetch_session
    @session = Session.find(params[:id])
  end

end
