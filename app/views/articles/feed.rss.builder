xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "dowloadapps"
    xml.author "Alfred Hdz"
    xml.description "Esta es una pagina donde podras descargar aplicaciones gratis y mas."
    xml.link articles_url
    xml.language "en"

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