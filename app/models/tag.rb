class Tag < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :id

	has_many :taggings
	has_many :articles, through: :taggings
	
	def to_s
    	name
  	end
end
