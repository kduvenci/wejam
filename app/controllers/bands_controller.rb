class BandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])

    @btnText = "Connect"
    current_user.jam_sessions.each do |jam_session|
      if jam_session.band_id == @band.id
        @btnText = jam_session.status
      end
    end
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
