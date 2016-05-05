#app/controllers/sitemaps_controller.rb
class SitemapController < ApplicationController
  respond_to :xml
  def index
    @articles = Article.all
  end
end