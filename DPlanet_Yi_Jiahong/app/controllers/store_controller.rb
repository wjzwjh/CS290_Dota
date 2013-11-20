class StoreController < ApplicationController
  def index
    @products=Array.new
    if params[:kind]=="All"
      Product.all.each do|product|
          @products<<product
      end
    elsif params[:kind]=="T-Shirt"
      Product.all.each do|product|
        if product.category=="T-Shirt"
          @products<<product
        end
      end
    elsif params[:kind]=="Toy"
      Product.all.each do|product|
        if product.category=="Toy"
          @products<<product
        end
      end
    else
      @products = Product.order(:title)
    end
    respond_to do |format|
      format.html{}
      format.json {head :no_content }
      render layout: "navi-bar"


    end

  end
end
