xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'

xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9', 'xmlns:image' => 'http://www.google.com/schemas/sitemap-image/1.1', 'xmlns:video' => 'http://www.google.com/schemas/sitemap-video/1.1' do
  xml.url do
    xml.loc root_url
    xml.changefreq("hourly")
    xml.priority "1.0"
  end
  @articles.each do |article|  
    xml.url do
      xml.loc article_url(article)
      xml.changefreq("daily")
      xml.priority "0.9"
      xml.lastmod article.updated_at.strftime("%Y-%m-%d")
      xml.tag! 'image:image' do
        xml.tag!("image:loc",article.image.url)
        xml.tag!("image:title",article.title)
      end
    end
  end
  category_where.each do |tag|
    xml.url do
      xml.loc tag_url(tag)
      xml.changefreq("daily")
      xml.priority "0.9"
      xml.lastmod tag.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
    end
  end
end
