#app/controllers/sitemaps_controller.rb
class SitemapsController < ApplicationController
  respond_to :xml
  def index
    @articles = Article.all
  end
end