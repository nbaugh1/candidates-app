class Dems2020::Scraper
    BASE_URL = "https://ballotpedia.org"
    
    def self.scrape_names
        Nokogiri::HTML(open("#{BASE_URL}/Democratic_presidential_nomination,_2020"))
    end

    def self.scrape_profile_page(candidate_url)
        Nokogiri::HTML(open("#{BASE_URL}#{candidate_url}"))
    end
end
    
    