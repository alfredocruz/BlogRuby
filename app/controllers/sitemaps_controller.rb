class SitemapsController 
  def show
    @articles = Article.where(:active => true) #we are generating url's for posts
    respond_to do |format|
     format.xml
    end
  end
end
