class BandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
    @btnText = "Connect"

    if user_signed_in?
      current_user.jam_sessions.each do |jam_session|
        if jam_session.band_id == @band.id
          @btnText = jam_session.status
        end
      end
    end
  # Geocode bellow
    # @addresses = Address.where.not(latitude: nil, longitude: nil)
    # @markers = @addresses.map do |location|
    #   {
    #     lng: address.longitude,
    #     lat: address.latitude
    #   }
    # end
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
