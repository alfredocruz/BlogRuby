xml.instruct!
xml.rss :version => "2.0", 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title "dowloadapps"
    xml.webmaster "Alfred Hdz"
    xml.description "Esta es una pagina donde podras descargar aplicaciones gratis y mas."
    xml.link root_url
    xml.language "en"
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => articles_url

    for article in @articles
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.description article.body
        xml.pubDate article.created_at.to_s(:rfc822)
        
        xml.link article_url(article)
        xml.guid article_url(article)
      end
    end
  end
end