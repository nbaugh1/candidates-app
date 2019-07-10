class Dems2020::Scraper

    BASE_URL = "https://ballotpedia.org"
    
    
    def self.name_list_page
        Nokogiri::HTML(open("#{BASE_URL}/Democratic_presidential_nomination,_2020"))
    end

    def self.make_candidates
        name_list_page.css("div.mobile-columns ul li b a").each do |candidate|
            Dems2020::Candidate.new(candidate.text, candidate.attribute('href').value)
        end
    end

    def self.add_campaign_info
        Dems2020::Candidate.all.each do |candidate|
            candidate_info_page = Nokogiri::HTML(open("#{BASE_URL}#{candidate.info_page_url}"))
            candidate.quote = candidate_info_page.css("td")[3].text
            candidate.summary = candidate_info_page.css("p")[9..11].text
        end
    end

    def self.add_candidate_news
        Dems2020::Candidate.all.each do |candidate|
            candidate_info_page = Nokogiri::HTML(open("#{BASE_URL}#{candidate.info_page_url}"))
            candidate.news = candidate_info_page.css("li.panel ul")[1].text
        end
        binding.pry
    end
        


end
    
    