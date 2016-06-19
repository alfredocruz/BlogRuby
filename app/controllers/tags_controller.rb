class TagsController < ApplicationController
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_tag, only: [:show, :edit, :update, :destroy]
	before_action :set_tag_all, only: [:show, :index]
	load_and_authorize_resource
	respond_to :html, :json
	def index
	    set_meta "title" => "Categorias"
	    set_meta "og:title"   => "Categorias"
  	end

	def show
		@articles_visit = Article.limit(10).order_visits
		set_meta "title" => "Descargar aplicaciones sobre "+@tag.name+" para android"
	    set_meta "og:title"   => @tag.name
	    set_meta "og:description"   => @tag.description
	    set_meta "og:image"   => @tag.img.url
	end
	def edit
	end
	def update
	    respond_to do |format|
	      if @tag.update(tag_params)
	        format.html { redirect_to @tag, notice: 'Tag se ha actualizado correctamente.' }
	        format.json { render :show, status: :ok, location: @tag }
	      else
	        format.html { render :edit }
	        format.json { render json: @tag.errors, status: :unprocessable_entity }
	      end
	    end
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
			set_meta "viewport"   => "width=device-width, initial-scale=1"
		end
	    # Use callbacks to share common setup or constraints between actions.
	    def set_tag
	      @tag = Tag.friendly.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def tag_params
	      params.require(:tag).permit(:name,:img,:description)
	    end
end
