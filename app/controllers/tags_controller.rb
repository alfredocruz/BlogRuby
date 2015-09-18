class TagsController < ApplicationController
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_tag, only: [:show, :edit, :update, :destroy]
	before_action :set_tag_all, only: [:show, :index]
	load_and_authorize_resource
	
	def index
    	
	    set_meta "title" => "Categorias"
	    set_meta "viewport"   => "width=device-width, initial-scale=1"
	    set_meta "og:title"   => "Categorias"
  	end

	def show

	end

	def destroy
	    @tag.destroy
	    respond_to do |format|
	      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
	      format.json { head :no_content }
	    end
  	end

	private
		def set_tag_all
			@tags = Tag.all
		end
	    # Use callbacks to share common setup or constraints between actions.
	    def set_tag
	      @tag = Tag.friendly.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def tag_params
	      params.require(:tag).permit(:name)
	    end
end
