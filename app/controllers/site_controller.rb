class SiteController < ApplicationController
  layout "site"

  def index
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'home'
  end

  def contact
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

  def about
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

  def album
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

  	flash[:notice] = "This page will display the approved albums that are distributed by StakeOn2."

    redirect_to home_path
  end

  def learn
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

  def faq
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

  def winner
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

  	flash[:notice] = "This page displaying winners will be made available after the games begin."

    redirect_to home_path
  end

  def learn
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

  def games
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

  def play
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

  	flash[:notice] = "Details of playing online will be made available when the online games starts."

    redirect_to home_path
  end

  def result
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

  def vendors
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

  	flash[:notice] = "This page displaying eligible vendors for StakeOn2 will be made available as registeration begins."

    redirect_to home_path
  end

end

