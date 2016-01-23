class Article < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :title, use: [:slugged, :history]
  	mount_uploader :image, ArticleUploader
  	belongs_to :user
  	has_many :taggings
  	has_many :tags, through: :taggings

	validates :title, :presence =>{ :message=>"Usted debe de ingresar un titulo" }
	validates :body, :presence =>{ :message=>"Usted debe de ingresar un Cuerpo" }
	validates :link_des, :presence=>{ :message=>"Usted debe de ingresar un link de descarga" }
	validates :tamano, :presence =>{ :message=>"Usted debe de ingresar un tamaño en MB" }
	before_save :set_visits_count
	scope :ultimos, -> {order("created_at DESC")}
	scope :order_visits, ->{order("visits_count DESC")}

	def tag_list
  		self.tags.collect do |tag|
    		tag.name
  		end.join(", ")
	end
	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  		self.tags = new_or_found_tags
	end
	def update_visits_count
		self.save if self.visits_count.nil?
		self.update(visits_count: self.visits_count + 1)
	end
	
	def self.search(search)#buscador inicio
		if search 
		    where("title LIKE ? or slug LIKE ? or markup_body LIKE ?","%#{search}%","%#{search}%","%#{search}%")
		else
			all
  		end
	end#buscador fin
	
	private
	def set_visits_count
		self.visits_count ||= 0
	end
end
