class ApplicationMailer < ActionMailer::Base
#qui va de donde van a salir los correos 
  default from: "alfredocruz9292@gmail.com"
  layout 'mailer'
end
