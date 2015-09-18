module ApplicationHelper
	def title
		if @title.nil?
			title = "DowloadApps"
		else
			title = @article.title
		end
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