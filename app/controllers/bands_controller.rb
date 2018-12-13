class BandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = " \
        name @@ :query \
        OR genre @@ :query \
        OR description @@ :query \
        OR address @@ :query \
      "
      @bands = Band.where(sql_query, query: "%#{params[:query]}%")
    else
      @bands = Band.all
    end

  end

  def show
    @band = Band.find(params[:id])
    @markers = [{ lat: @band.latitude, lng: @band.longitude }]

    if current_user
      @jam_session = current_user.jam_sessions.find_by(band: @band) || JamSession.new
    else
      @jam_session = JamSession.new
    end
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    @band.user = current_user
    if @band.save
      redirect_to band_path(@band)
    else
      render :new
    end
  end

  private

  def band_params
    params.require(:band).permit(:name, :genre, :address, :photo, :instrument, :description)
  end

end
