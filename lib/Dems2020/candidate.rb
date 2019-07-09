class Dems2020::Candidate
    attr_accessor :name, :info_page :quote, :summary

    @@all = []

    def initialize (name = nil, info_page = nil)
        @@all << self
        @name = name
        @info_page = info_page_url
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
end

