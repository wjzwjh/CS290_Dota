class SessionsController < ApplicationController
  def new
    if session[:userName]!=nil
      redirect_to "/home"
    end
  end

  def create
    logger.info(params[:userName])
    logger.info(params[:password])

    if user = User.authenticate(params[:userName],params[:password])
      @user= params[:userName]
      session[:user_id] = user.id
      session[:userName] = params[:userName]
      logger.info('Sign in Successfully')
      #format.html { redirect_to(@session)}
      #<%= link_to 'Store',store_index_path %></a>
      redirect_to "/home" ,:notice => session[:userName]
    else
      #redirect_to(:back)
      redirect_to '/users/login', :notice => "Invalid userName/password"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:userName] = nil
    @cart = current_cart
    @cart.line_items.each do |line_item|
      product = Product.find(line_item.product_id)
      product.update_attributes(:quantity => product.quantity+ line_item.quantity)
    end
    session[:cart_id] = nil
    #redirect_to  login_url, :notice =>"Logged out"
    redirect_to :back
  end


end