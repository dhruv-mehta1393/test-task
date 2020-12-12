class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    @campaigns = Campaign.all
    @discussions = Discussion.all
  end

  def user_lists
    @users = User.where(role:'Novice')
    puts @users.inspect
  end

  def edit_user_status
    @user = User.find(params[:id])
  end

  def update_user_status
  end
  
end
