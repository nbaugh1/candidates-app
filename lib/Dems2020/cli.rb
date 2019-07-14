class Dems2020::CLI
    @@selected_candidate = nil

    def self.run
        Dems2020::Candidate.make_candidates
        start
    end

    def self.start
        system 'clear'
        puts ""
        puts ""
        puts "2020 #{'DEMOCRATIC'.blue} CANDIDATES FOR PRESIDENT"
        puts ""
        puts "========================================"
       
        list_candidates
        get_candidate_selection
        select_candidate
        print_candidate_info
        list_or_exit
    end

    def self.list_candidates
        Dems2020::Candidate.all.each_with_index do |candidate, index|
            puts "#{index + 1}. #{candidate.name}"
        end
    end

    def self.get_candidate_selection
        puts "========================================"
        puts ""
        puts "Please enter the number of the candidate which you like to learn more about, or enter #{'exit'.red} to exit: "
        @input_number = gets.strip
        check_input
    end

    def self.check_input
        if @input_number.downcase == 'exit'
            puts "Thanks! Goodbye."
            exit
        elsif @input_number.to_i > Dems2020::Candidate.all.length || @input_number.to_i <= 0
            start
        end
    end

    def self.select_candidate
        @@selected_candidate = nil
        @@selected_candidate = Dems2020::Candidate.selected_candidate(@input_number)
        Dems2020::Candidate.add_candidate_info(@@selected_candidate)
    end
             

    def self.list_or_exit
        puts ""
        puts "================================================================"
        puts ""
        puts "To return to the candidate list enter #{'list'.green}"
        puts "To exit enter #{'exit'.red}"
       
        input = gets.strip
        if input == 'list'
            start
        elsif input == 'exit'
            puts "Thanks! Goodbye"
            exit
        else
            puts "Sorry, I didn't understand that"
            list_or_exit
        end
    end

    def self.print_candidate_info
        system 'clear'
        puts ""
        puts ""
        puts "You have chosen to learn more about -#{@@selected_candidate.name.blue}-"
        puts "================================================================"
        puts ""
        puts "#{"#{@@selected_candidate.name}'s".blue} reason for running for president in 2020:"
        puts ""
        puts "'#{@@selected_candidate.quote}' -#{@@selected_candidate.name}"
        puts ""
        puts "================================================================"
        puts ""
        puts "Summary of #{"#{@@selected_candidate.name}'s".blue} campaign platform and experience:"
        puts ""
        puts @@selected_candidate.summary
        puts ""
        puts "================================================================"
        puts ""
        puts "Recent news about #{@@selected_candidate.name.blue}:"
        puts ""
        puts @@selected_candidate.news1
        puts ""
        puts @@selected_candidate.news2
        puts ""
        puts @@selected_candidate.news3
    end
end
