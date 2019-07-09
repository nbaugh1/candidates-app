class Dems2020::Scraper
    
    def self.get_page
        Nokogiri::HTML(open("https://ballotpedia.org/Democratic_presidential_nomination,_2020"))
    end

    def self.make_candidates
        self.get_page.css("div.mobile-columns ul li b a").each do |candidate|
            name = candidate.text
            info_page_url = candidate.attribute('href').value
            Dems2020::Candidate.new(name, info_page_url)
        end
    end


end
    
    