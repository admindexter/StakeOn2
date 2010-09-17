class RulesController < ApplicationController
  layout "site"

  def marketer
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

  def stakers
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

end

