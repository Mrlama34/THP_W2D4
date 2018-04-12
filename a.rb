require 'rubygems'
require 'nokogiri'
require 'open-uri'


def route_de_la_mairie
liste = Hash.new
pages = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

news_links = pages.css(".lientxt")
news_links.each { |link|  url = "http://annuaire-des-mairies.com"+link['href']
						liste.merge!(nom: url)
				link.each { |email| page = Nokogiri::HTML(open(url))
							email = page.css("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text
							liste.merge!(email: email)
							}
puts liste
				}

end
route_de_la_mairie