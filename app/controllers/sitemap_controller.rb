class SitemapController < ApplicationController
  layout nil

  def index
    headers['Content-Type'] = 'application/xml'
    last_article = Article.last
    if stale?(:etag => last_article, :last_modified => last_article.updated_at.utc)
      respond_to do |format|
        format.xml { @articles = Article.all }
      end
    end
  end
end