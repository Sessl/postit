class SessionsController < ApplicationController

  def new
                 #since there is no model involved, the login is not a model backed form.
  end

  def create
    # user.authenticate('password')
    # 1. get the user obj
    # 2. see if password matches
    # 3. if so, log in
    # 4. if not, error messages

    user = User.find_by(username: params[:username]) # we are using a local variable instead of the usual instance variable since there won't be any errors on the object so we are using a local variable
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id #don't add the user object in the session because it's cookie backed will grow and result in session cookie overflow error. So only save user.id
      flash[:notice] = "You are logged in!"
      redirect_to root_path
      
    else
      flash[:error] = "There's something wrong with your username or password"
      redirect_to register_path
    end

  end 

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've successfully logged out!"
    redirect_to root_path
  end
end