class User < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :username
  	has_many :authentications, :dependent => :delete_all 
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,:recoverable, 
		  	:rememberable, :trackable, :validatable, :omniauthable

  	has_many :articles
 	def apply_omniauth(omniauth)
    	user.authentications.build(:provider => omniauth['provider'], 
    						:uid => omniauth['uid'], 
    						:token => omniauth['credentials'].token, 
    						:token_secret => omniauth['credentials'].secret)
  	end
  	def password_required?
        (authentications.empty? || !password.blank?) && super 
    end

    def update_with_password(params, *options)
        if encrypted_password.blank?
              update_attributes(params, *options)
        else
              super
        end
    end
end
