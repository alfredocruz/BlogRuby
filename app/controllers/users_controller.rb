class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update]
	before_action :set_meta_tags
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

  	def finish_signup
	    if request.patch? && params[:user] # Revisa si el request es de tipo patch, es decir, llenaron el formulario y lo ingresaron
	      @user = User.find(params[:id])

	      if @user.update(user_params)
	        sign_in(@user, :bypass => true)
	        redirect_to root_path, notice: 'Hemos guardado tu email correctamente.'
	      else
	        @show_errors = true
	      end
	    end
  	end

	private
	def set_meta_tags
		set_meta "title" => "dowloadapps"
		set_meta "viewport"   => "width=device-width, initial-scale=1"
	end
	def set_user
		@user = User.friendly.find(params[:id])
	end
    def user_params
    	accessible = [ :name, :email,:role,:username ] # extend with your own params
      	accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?

      	params.require(:user).permit(accessible)
    end
end