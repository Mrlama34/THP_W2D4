require 'rubygems'
require 'nokogiri'
require 'open-uri'

def incubateurs_list

pages = Nokogiri::HTML(open("http://www.alloweb.org/annuaire-startups/annuaire-incubateurs-startups"))
news_links = pages.css("a.listing-row-image-link")

    news_links.each{|balise| 
        url = balise['href']
        page = Nokogiri::HTML(open(url))
        puts page.xpath("//div/h1").text
        puts page.css("#listing-detail-section-description > div > div:nth-child(1) > div > div > div > div > div > p:nth-child(7) > a:nth-child(1)").map { |link2| link2['href']}

}
 
end

incubateurs_list

