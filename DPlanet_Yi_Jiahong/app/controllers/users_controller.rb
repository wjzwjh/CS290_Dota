class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new

  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    session[:userName] = @user.userName



    respond_to do |format|
      if @user.save
        user = User.find_by_userName(params[:user][:userName])
        session[:user_id] =user.id
        format.html { redirect_to('/home', :notice => "User #{@user.userName} was successfully created." )}
        #format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def checkName
    if User.where('userName = ?', params[:userName]).count == 0
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 409
    end
    return
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:userName,:password)
  end

  def check_email
    @user = User.find_by_email(params[:user][:email])

    respond_to do |format|
      format.json { render :json => !@user }
    end
  end

end
