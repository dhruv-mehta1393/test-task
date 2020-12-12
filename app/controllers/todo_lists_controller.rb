class TodoListsController < ApplicationController

	before_action :check_campaign_exsists
  def new
    @todo_list = Todo.new
  end

	def create
		@todo = Todo.new(params[:object])
		if @todo.save
			flash[:success] = "Object successfully created"
			redirect_to root_path
		else
			flash[:error] = "Something went wrong"
			render 'new'
		end
  end
  
  private

  def check_campaign_exsists
    if !Campaign.first.present?
      flash[:error] = "Campaign dose not exsists"
      redirect_to root_path
    end
  end

	def todo_params
    params.require(:todo).permit(:title,  :campaign_id)
  end

end