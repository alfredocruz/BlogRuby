class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:show ,:index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only:[:show,:index]
  before_action :set_meta_tags
  load_and_authorize_resource :except =>[:create]
  # GET /articles
  # GET /articles.json
  def index
    set_meta "description"   => "Aplicaciones para Android, juegos , temas,herramientas, multimedia y mucho mejor que playstore"
    set_meta "title" => "dowloadapps"
    set_meta "og:title"   => "dowloadapps"
    set_meta "og:description"   => "Aplicaciones para Android, juegos , temas,herramientas, multimedia y mucho mejor que playstore"
    set_meta "og:image"   => "http://res.cloudinary.com/alfredhdz/image/upload/v1442532590/unnamed_pikq1m.png"
    @articles = Article.search(params[:search]).paginate(:per_page => 12, :page => params[:page]).ultimos
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    set_meta "twitter:description"  => Sanitize.fragment(@article.body.truncate(100), Sanitize::Config::RELAXED).html_safe
    set_meta "title" => @article.title
    set_meta "og:title"   => @article.title
    set_meta "og:image"   => @article.image.url
    @article.update_visits_count
    if request.path != article_path(@article)
      redirect_to @article, status: :moved_permanently
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    
  end

  # POST /articles
  # POST /articles.json
  def create
   @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_meta_tags
      set_meta "viewport"   => "width=device-width, initial-scale=1"
    end
    def set_tags
      @tags = Tag.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title,:body,:link_des,:tamano,:image,:tag_list,:markup_body)
    end
end
