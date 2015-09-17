class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update]
	before_action :authenticate_user!
	load_and_authorize_resource
	def edit
  	end
	def index
		@users = User.all
	end
	def update
	    if @user.update(user_params)
	    	redirect_to users_url
	    else
	      render 'edit'
	    end
  	end

	private
	def set_user
		@user = User.friendly.find(params[:id])
	end
    def user_params
      params.require(:user).permit(:role)
    end
end