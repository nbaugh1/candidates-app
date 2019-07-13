class Dems2020::CLI
    @@selected_candidate = nil

    def self.run
        #Dems2020::Scraper.scrape_names_and_profile_pages
        Dems2020::Candidate.make_candidates
        #Dems2020::Scraper.add_campaign_info
        start
    end

    def self.start
        system 'clear'
        puts ""
        puts ""
        puts "2020 DEMOCRATIC CANDIDATES FOR PRESIDENT"
        puts ""
        puts "========================================"
       
        list_candidates
        get_candidate
        print_candidate_info
        list_or_exit
    end

    def self.list_candidates
        Dems2020::Candidate.all.each_with_index do |candidate, index|
            puts "#{index + 1}. #{candidate.name}"
        end
    end

    def self.get_candidate
        puts "========================================"
        puts ""
        puts "Please enter the number of the candidate which you like to learn more about: "
        input_number = gets
        @@selected_candidate = Dems2020::Candidate.selected_candidate(input_number)
        Dems2020::Candidate.add_candidate_info(@@selected_candidate)
    end

    def self.list_or_exit
        puts ""
        puts "================================================================"
        puts ""
        puts "To return to the candidate list enter 'list'"
        puts "To exit enter 'exit'"
       
        input = gets.strip
        if input == 'list'
            start
        elsif input == 'exit'
            puts "Thanks! Goodbye"
        else
            puts "Sorry, I didn't understand that"
            list_or_exit
        end
    end

    def self.print_candidate_info
        system 'clear'
        puts ""
        puts ""
        puts "You have chosen to learn more about -#{@@selected_candidate.name}-"
        puts "================================================================"
        puts ""
        puts "#{@@selected_candidate.name}'s reason for running for president in 2020:"
        puts ""
        puts "'#{@@selected_candidate.quote}' -#{@@selected_candidate.name}"
        puts ""
        puts "================================================================"
        puts ""
        puts "Summary of #{@@selected_candidate.name}'s campaign platform and experience:"
        puts ""
        puts @@selected_candidate.summary
        puts ""
        puts "================================================================"
        puts ""
        puts "Recent news about #{@@selected_candidate.name}:"
        puts ""
        puts @@selected_candidate.news1
        puts ""
        puts @@selected_candidate.news2
        puts ""
        puts @@selected_candidate.news3
    end
end
