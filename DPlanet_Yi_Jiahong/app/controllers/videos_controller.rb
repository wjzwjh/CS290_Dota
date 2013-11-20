class VideosController < ApplicationController
  # GET /videos
  # GET /videos.json
  def index
    if  params[:id]
      @video = Video.find(params[:id])
    end
    if params[:video]!=nil or params[:comment]!=nil or params[:comment_version]!=nil or params[:asset]!=nil or params[:avatar]!=nil
        if params[:comment]!=nil
          if session[:userName]==nil
            @video.comment+="Anoymous"+": "+params[:comment].to_s+"       ("+Time.now.to_s+")"+"\n"
          else
          @video.comment+=session[:userName]+": "+params[:comment].to_s+"       ("+Time.now.to_s+")"+"\n"
          end
        end
      if @video.comment_version==''
        @video.comment_version=@video.avatar_file_name
      end

      if  params[:comment_version]!=nil
        @video.comment_version=params[:comment_version].to_s
      elsif
        @video.comment_version="Version"
      end
      @video.save
      respond_to do |format|
      format.html { redirect_to @video }
      format.js { render :layout=>false }
      format.json { head :no_content }
      end
    else

    @videos = Video.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
    end
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html{} # show.html.erb
      format.json {}
      render layout: "navi-bar"
    end
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new
      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(params[:video])

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update

    @video = Video.find(params[:id])
    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end
end

