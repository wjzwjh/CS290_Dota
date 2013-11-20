class GalleriesController < ApplicationController

  def index
    if params[:id]
      @gallery= Gallery.find(params[:id])
      if session[:userName]==nil
        @gallery.comment+="Anoymous"+": "+params[:comment].to_s+"       ("+Time.now.to_s+")"+"\n"
      else
        @gallery.comment+=session[:userName]+": "+params[:comment].to_s+"       ("+Time.now.to_s+")"+"\n"
      end
      @gallery.save
      respond_to do |format|
        format.html { redirect_to @gallery }
        format.js { render :layout=>false }
        format.json { head :no_content }
      end
    else
      @galleries = Gallery.all
      render layout: "navi-bar"
      end
    end


  def show
    @gallery = Gallery.find(params[:id])
    render layout: "navi-bar"
  end

  def new
    @gallery = Gallery.new
    render layout: "navi-bar"
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      flash[:notice] = "Successfully created gallery."
      redirect_to @gallery
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Successfully updated gallery."
      redirect_to gallery_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Successfully destroyed gallery."
    redirect_to galleries_url
  end
end
