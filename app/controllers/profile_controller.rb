class ProfileController < ApplicationController
  layout "site"

  def index
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @title = "StakeOn2 Profiles"
  end

  def show
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    username = params[:username]
    @user = User.find_by_username(username)
    if @user
      @title = "My StakeOn2 Profile for #{username}"
    else
      flash[:notice] = "No user #{username} at RailsSpace!"
      redirect_to :action => "index"
    end
  end
end

