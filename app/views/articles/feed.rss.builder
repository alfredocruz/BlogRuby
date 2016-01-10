xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "dowloadapps"
    xml.author "Alfred Hdz"
    xml.description "Esta es una pagina donde podras descargar aplicaciones gratis y mas."
    xml.link "http://dowloadapps.herokuapp.com"
    xml.language "en"

    for article in @articles
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.description article.body
        xml.author "Alfred Hdz"
        xml.pubDate article.created_at.to_s(:rfc822)
        
        xml.link "http://dowloadapps.herokuapp.com/android/" + article.slug.to_s
        xml.guid article.slug
        text = article.body
      end
    end
  end
end