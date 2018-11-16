class JamSessionsController < ApplicationController
  def create
    @jam_session = JamSession.new
    @jam_session.status = 'Pending'
    @jam_session.user = current_user
    @band = Band.find(params[:band_id])
    @jam_session.band = @band
    if @jam_session.save
      respond_to do |format|
        puts "Saving!"
        format.html { redirect_to band_path(@band) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        puts "Not saving!"
        format.html { render band_path(@band) }
        format.js  # <-- idem
      end
    end

    # if @jam_session.save
    #   redirect_to band_path(@band)
    # else
    #   render band_path(@band)
    # end
  end

  def update
    @jam_session = JamSession.find(params[:id])
    @jam_session.status = 'Accepted'
    @jam_session.save
    redirect_to band_path(@jam_session.band)
  end

  def destroy
    @jam_session = JamSession.find(params[:id])
    @jam_session.destroy
    redirect_to band_path(@jam_session.band)
  end
end
