class Dems2020::Candidate
    attr_accessor :name, :info_page_url, :quote, :summary, :news

    @@all = []

    def initialize (name = nil, info_page_url = nil, quote = nil, summary = nil, news = nil)
        @@all << self
        @name = name
        @info_page_url = info_page_url
        @quote = quote
        @summary = summary
        @news = news
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        if self.all.detect {|s| s.name == name}
            puts name
        else
            puts "Candidate not found."
        end
    end

    def self.find_by_index(input_number)
        Dems2020::Candidate.all[input_number - 1]
    end
end

