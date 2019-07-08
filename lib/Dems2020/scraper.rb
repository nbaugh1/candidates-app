class Dems2020::Scraper
    def self.scrape
        doc = Nokogiri::HTML(open("https://ballotpedia.org/Democratic_presidential_nomination,_2020"))
        cand_list = []
        doc.css("div.mobile-columns ul li b a").each do |name|
            cand_list << name.text
        end
        binding.pry
    end
end