class Dems2020::Scraper
    BASE_URL = "https://ballotpedia.org"
    LIST_URL = "#{BASE_URL}/Democratic_presidential_nomination,_2020"
    def self.scrape
        doc = Nokogiri::HTML(open(LIST_URL))
        #binding.pry
        cand_list = []
        cand_links = []
        
        doc.css("div.mobile-columns ul li").each do |name|           #GRABS CANDIDATES NAMES
            cand_list << name.text
        end
        doc.css("div.mobile-columns ul li b a").each do |link|       #GRABS URL SLUGS FOR PROFILE PAGES
            cand_links << link.attribute('href').value
        end
        #binding.pry
    end
end