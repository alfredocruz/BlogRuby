module ApplicationHelper
  def category_where
    @category_where = Tag.where(:name =>["juegos","comunicacion","herramientas","lifestyle","multimedia","productividad"])
  end
  def tags
    @tags = Tag.all
  end
  def articulos
    @articulos = Article.all
  end
	def resource_class
  		devise_mapping.to
	end

	def resource_name
    	:user
  	end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end