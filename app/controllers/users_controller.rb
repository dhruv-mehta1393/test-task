class UsersController < ApplicationController
  
  def index
    @users = User.where(role:'Novice')
    authorize @users, :show_ideas?
    
  end

  def edit
    @user = User.find(params[:id])
  end
  

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "User was successfully updated"
        redirect_to users_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def user_params
    params.require(:user).permit(:status)
  end

end
