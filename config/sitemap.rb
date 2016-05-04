# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://dowloadapps.herokuapp.com/"
SitemapGenerator::Sitemap.public_path = 'tmp/sitemaps/'
SitemapGenerator::Sitemap.create do

  add articles_path, :priority => 0.7, :changefreq => 'daily'

    Article.find_each do |article|
      add article_path(article), :lastmod => article.updated_at
    end
end
