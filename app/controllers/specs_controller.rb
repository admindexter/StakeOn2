class SpecsController < ApplicationController
  before_filter :protect

  layout "site"

  def index
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    redirect_to :controller => "user", :action => "index"
  end

  # Edit the user's spec.
  def edit
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @title = "Edit Spec"
    @user = current_user
    @user.spec ||= Spec.new
    @spec = @user.spec
    if param_posted?(:spec)
      if @user.spec.update_attributes(params[:spec])
        flash[:notice] = "Changes saved."
        redirect_to :controller => "users", :action => "index"
      end
    end
  end
end

