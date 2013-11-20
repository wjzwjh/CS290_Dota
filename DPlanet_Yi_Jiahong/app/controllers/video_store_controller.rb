class VideoStoreController < ApplicationController
  def index
    @videos=Array.new
    if params[:kind]=="Comment"
      Video.all.each do|video|
        if video.kind=="comment"
          @videos<<video
        end
      end
    elsif params[:kind]=="Contest"
      Video.all.each do|video|
        if video.kind=="contest"
          @videos<<video
        end
      end
    elsif params[:kind]=="Tutorial"
      Video.all.each do|video|
        if video.kind=="tutorial"
          @videos<<video
        end
      end
    else
      @videos = Video.order(:title)
    end
    respond_to do |format|
      format.html{}
      format.json {}
      render layout: "navi-bar"
    end
  end

end