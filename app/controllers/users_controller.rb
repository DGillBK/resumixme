class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #  see if they are alreayd logged in
    if current_user

      # send users to their resumes page
      redirect_to '/resumes' and return
    end
    render :index
  end

  def login

    # finds user by their email address, then compares password
    user = User.find_by(email: params['email'])
    # if there is a user with that email see if it's password matches
    if user && user.authenticate(params['password'])

      # Make a current suer variable to use in the template 
      @current_user = user
      
      # and make a session with the user info to use throughout the app
      session[:user_id] = user.id

      # redirects to different routes based on user type
      redirect_to '/resumes'
    else
      # show user an error when login fails
      @error = "Incorrect email or passowrd. Please try again."
      render :index
    end
  end

  def logout
    # remove everything from the session
    # .clear is a method to remove everything from a session
    session.clear
    # send user back to login screen
    redirect_to "/"
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def profile
    @user = current_user
  end

  def profileEdit
    @user = current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to '/resumes', notice: 'User was successfully updated.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to '/resumes', notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(email: params['email'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :phone, :url, :linkedin)
    end
end
