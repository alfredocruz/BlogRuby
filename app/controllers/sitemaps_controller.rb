class SitemapsController < ApplicationController

	def show
	    @articles = Article.all
	    	respond_to do |format|
	     	format.html
	     	format.xml
	    end
  	end

end
