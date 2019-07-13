class Dems2020::Candidate
    attr_accessor :name, :url, :quote, :summary, :news1, :news2, :news3

    @@all = []

    def initialize (name = nil, url = nil, quote = nil, summary = nil, news1 = nil, news2 = nil, news3 = nil)
        @@all << self
        @name = name
        @url = url
        @quote = quote
        @summary = summary
        @news1 = news1
        @news2 = news2
        @news3 = news3
    end

    def self.make_candidates
        Dems2020::Scraper.scrape_names.css("div.mobile-columns ul li b a").each do |candidate|
            self.new(candidate.text, candidate.attribute('href').value)
        end
    end

    def self.selected_candidate(input_number)
        self.all[input_number.to_i - 1]
    end

    def self.add_candidate_info(candidate)
        candidate_info_page = Dems2020::Scraper.scrape_profile_page(candidate.url)
        candidate.quote = candidate_info_page.css("td")[3].text
        candidate.summary = candidate_info_page.css("p")[9..11].text
        candidate.news1 = candidate_info_page.css("li.panel ul")[0].text
        candidate.news2 = candidate_info_page.css("li.panel ul")[1].text
        candidate.news3 = candidate_info_page.css("li.panel ul")[2].text
    end

    def self.all
        @@all
    end
end

