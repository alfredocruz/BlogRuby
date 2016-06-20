class User < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :username
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,:recoverable, 
		  	:rememberable, :trackable, :validatable, :omniauthable

  	has_many :articles
end
