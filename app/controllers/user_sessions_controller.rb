class UserSessionsController < ApplicationController
  layout "site"

  def new
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to home_path
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to home_path
  end
end

