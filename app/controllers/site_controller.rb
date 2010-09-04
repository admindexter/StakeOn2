class SiteController < ApplicationController

  def index
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'home'
  end

  def contact
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'site'
  end

  def about
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'site'
  end

  def faq
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'site'
  end

  def winner
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'site'
  end

  def learn
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'site'
  end

  def games
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'site'
  end

  def play
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'site'
  end

  def result
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'site'
  end

end

