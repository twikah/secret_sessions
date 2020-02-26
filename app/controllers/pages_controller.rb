class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @sessions = Session.all
  end
end
