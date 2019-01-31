class UsersController < ApplicationController 
   def new 
     @user = User.new
   end 

   def show 
     @user = current_user
   end

  def index 
    @user = User.find_by(id: params[:id])
    render :show
  end

   def create 
    user = User.new(user_params)

    if user.save!
      redirect_to user_url(user)
    else
      render json: user.errors.full_messages
    end
   end

   private 
   def user_params 
     params.require(:users).permit(:username, :password)
   end
end