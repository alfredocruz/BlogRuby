class UsersController < ApplicationController
	before_action :set_user, only: [:finish_signup,:show, :edit, :update, :destroy]
	before_action :set_meta_tags
	before_action :authenticate_user!
	#load_and_authorize_resource
	def show

	end
	def edit
  	end
	def index
		@users = User.all
	end
	# PATCH/PUT /users/:id.:format
	def update
	    # authorize! :update, @user
	    respond_to do |format|
	      if @user.update(user_params)
	        sign_in(@user == current_user ? @user : current_user, :bypass => true)
	        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

  	def finish_signup
	    if request.patch? && params[:user] # Revisa si el request es de tipo patch, es decir, llenaron el formulario y lo ingresaron

	      if @user.update(user_params)
	        sign_in(@user, :bypass => true)
	        redirect_to root_path, notice: 'Hemos guardado tu email correctamente.'
	      else
	        @show_errors = true
	      end
	    end
  	end
  	def destroy
	    # authorize! :delete, @user
	    @user.destroy
	    respond_to do |format|
	      format.html { redirect_to root_url }
	      format.json { head :no_content }
	    end
  	end
	private
	def set_meta_tags
		set_meta "title" => "dowloadapps"
		set_meta "viewport"   => "width=device-width, initial-scale=1"
	end
	def set_user
		@user = User.find(params[:id])
	end
    def user_params
    	accessible = [:email,:role,:username ] # extend with your own params
      	accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?

      	params.require(:user).permit(accessible)
    end
end