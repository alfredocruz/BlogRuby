Apps::Application.config.middleware.insert_before(Rack::Lock, Rack::Rewrite) do
  r301 %r{.*}, 'http://dowloadapps.herokuapp.com$&', :if => Proc.new {|rack_env|
    rack_env['SERVER_NAME'] != 'www.dowloadapps.herokuapp.com'
  }
end if Rails.env == 'production'