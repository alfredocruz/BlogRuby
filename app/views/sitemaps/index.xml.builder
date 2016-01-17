ase_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=>'1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  
 
  @articles.each do |p|
    xml.url {
      xml.loc("http://dowloadapps.herokuapp.com/#{p.id.to_s}")
      xml.changefreq("weekly")
      xml.priority(0.5)
    }
  end
end