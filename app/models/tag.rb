class Tag < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :name
  	mount_uploader :img, TagUploader
	has_many :taggings
	has_many :articles, through: :taggings
	
	def to_s
    	name
  	end
end
