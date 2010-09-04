class UsersController < ApplicationController
  layout 'site'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registeration Successful."
      redirect_to home_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to home_path
    else
      render :action => 'edit'
    end
  end
end

