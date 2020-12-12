class DiscussionsController < ApplicationController

  before_action :check_campaign_exsists
  def new
    @discussion = Discussion.new
  end
  
  def create
		@discussion = Discussion.new(discussion_params)
		@discussion.user_id = current_user.id
    if @discussion.save
			flash[:success] = "Discussion Topic successfully created"
			redirect_to root_path
    else
			flash[:error] = "Something went wrong"
			render 'new'
    end
	end
	
	def show
		@discussion = Discussion.find(params[:id])
	end
	
  
  def check_campaign_exsists
    if !Campaign.first.present?
      flash[:error] = "Campaign dose not exsists"
      redirect_to root_path
    end
  end


  def discussion_params
    params.require(:discussion).permit(:title, :campaign_id)
	end
	
end
