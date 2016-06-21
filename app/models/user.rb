class User < ActiveRecord::Base
	TEMP_EMAIL_PREFIX = 'change@me'
  	TEMP_EMAIL_REGEX = /\Achange@me/
	has_many :identities,  dependent: :destroy 
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,:recoverable, 
		  	:rememberable, :trackable, :validatable, :omniauthable

  	has_many :articles
  	validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  	def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      username = auth.extra.raw_info.name
      user = User.where(email: email).first if email

      # Create the user if it's a new registration
      if user.nil?
        password = Devise.friendly_token[0,20]
        if auth.provider == 'facebook'
          user = User.new(
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            password: password,
            username: username,
            password_confirmation: password
          )
        elsif auth.provider == 'twitter'
          user = User.new(
           	email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            password: password,
            password_confirmation: password
          )
        end
        user.skip_confirmation!
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
