class Dems2020::Cli

    def self.list_candidates
        Dems2020::Candidate.all.each_with_index do |candidate, index|
            puts "#{index + 1}. #{candidate.name}"
        end
    end
end