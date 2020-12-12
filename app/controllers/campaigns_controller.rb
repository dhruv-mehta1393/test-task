class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
    @campaign.todos.build
    authorize @campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id
    if @campaign.save
      flash[:success] = "Campaign successfully created"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    @comments = @campaign.comments
    @comment = Comment.new
  end
  

  def campaign_params
    params.require(:campaign).permit(:title, :est_duration, :purpose,:all_tags, :todos_attributes => [:title])
  end

end
