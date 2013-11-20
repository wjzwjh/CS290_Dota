class SessionsController < ApplicationController
  def new
    if session[:userName]!=nil
      redirect_to "/home"
    end
  end

  def create
    logger.info("fucker")
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
      logger.info('Invalid user and password')
      #redirect_to(:back)
      redirect_to '/users/login', :notice => "Invalid userName/password"
    end
  end

  def destroy
    logger.info("wtf"+session[:user_id].to_s)
    logger.info("wtf"+session[:cart_id].to_s)
    logger.info("??????????????????????")
    session[:user_id] = nil
    session[:userName] = nil
    session[:cart_id] = nil
    #redirect_to  login_url, :notice =>"Logged out"
    redirect_to :back
  end


end