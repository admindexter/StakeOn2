class UsersController < ApplicationController
  include ApplicationHelper
	helper :profile

  before_filter :protect, :only => "index"

  layout 'site'

  def index
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @users = User.all

    @title = "StakeOn2 User Hub"

    @user = current_user

    @user.spec ||= Spec.new

    @spec = @user.spec
  end

  def new
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

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
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

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

