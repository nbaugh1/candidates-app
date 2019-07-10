class Dems2020::Candidate
    attr_accessor :name, :info_page_url, :quote, :summary, :news1, :news2, :news3

    @@all = []

    def initialize (name = nil, info_page_url = nil, quote = nil, summary = nil, news1 = nil, news2 = nil, news3 = nil)
        @@all << self
        @name = name
        @info_page_url = info_page_url
        @quote = quote
        @summary = summary
        @news1 = news1
        @news2 = news2
        @news3 = news3
    end

    def self.all
        @@all
    end

    def self.find_by_index(input_number)
        Dems2020::Candidate.all[input_number - 1]
    end
end

