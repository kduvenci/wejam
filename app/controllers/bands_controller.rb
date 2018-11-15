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
    @jam_session = current_user.jam_sessions.find_by(band: @band) || JamSession.new
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_path(@band)
    else
      render :new
    end
  end

  private

  def band_params
    params.require(:band).permit(:name, :genre, :description, :photo)
  end

end
