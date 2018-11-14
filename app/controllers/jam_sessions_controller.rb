class JamSessionsController < ApplicationController

  def create
    @jam_session = JamSession.new
    @jam_session.status = 'Pending'
    @jam_session.user = current_user
    @band = Band.find(params[:band_id])
    @jam_session.band = @band

    if @jam_session.save
      redirect_to band_path(@band)
    else
      render band_path(@band)
    end
  end

  def destroy
    @jam_session = JamSession.find(params[:id])
    @jam_session.destroy
    redirect_to user_path
  end
end
