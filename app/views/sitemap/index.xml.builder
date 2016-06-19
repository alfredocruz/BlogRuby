xml.instruct!

xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
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
      xml.lastmod article.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
    end
  end
  category_where do |tag|
    xml.url do
      xml.loc tag_url(tag)
      xml.changefreq("daily")
      xml.priority "0.9"
      xml.lastmod tag.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
    end
  end
end
