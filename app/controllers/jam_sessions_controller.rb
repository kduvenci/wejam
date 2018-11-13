class JamSessionsController < ApplicationController

  def create
    @jam_session = JamSession.new(jam_session_params)

    @user = User.find(params[:user_id])
    @jam_session.user = @user

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

  private

  def jam_session_params
    params.require(:jam_session).permit(:status, :date)
  end

end
