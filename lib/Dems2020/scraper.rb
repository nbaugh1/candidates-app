class Dems2020::Scraper
    
    BASE_URL = "https://ballotpedia.org"
    LIST_URL = "#{BASE_URL}/Democratic_presidential_nomination,_2020"
    
    def self.scrape
        doc = Nokogiri::HTML(open(LIST_URL))
        candidates = []
        doc.css("div.mobile-columns ul li b a").each do |candidate|           
            candidates << {name: candidate.text, profile_URL: candidate.attribute('href').value}
        end
    end

    def self.profile_scraper (profile_url)
    
    end
end