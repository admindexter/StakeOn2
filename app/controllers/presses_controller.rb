class PressesController < ApplicationController
  layout "site"

  def index
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @presses = Press.all

    @presses = Press.paginate  :per_page => 5, :page => params[:page],
    							             :order => 'created_at DESC'
  end

  def show
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @press = Press.find(params[:id])
  end

  def new
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @press = Press.new
  end

  def create
    @press = Press.new(params[:press])
    if @press.save
      flash[:notice] = "Successfully created press."
      redirect_to @press
    else
      render :action => 'new'
    end
  end

  def edit
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @press = Press.find(params[:id])
  end

  def update
    @press = Press.find(params[:id])
    if @press.update_attributes(params[:press])
      flash[:notice] = "Successfully updated press."
      redirect_to @press
    else
      render :action => 'edit'
    end
  end

  def destroy
    @press = Press.find(params[:id])
    @press.destroy
    flash[:notice] = "Successfully destroyed press."
    redirect_to presses_url
  end
end

