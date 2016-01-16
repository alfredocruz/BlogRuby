class Welcome < ApplicationMailer
  def notify(article)
  	@article = article
  	User.all.each do |user|
    	mail to: user.email,subject:'Bienvenido'
    end
  end
end
