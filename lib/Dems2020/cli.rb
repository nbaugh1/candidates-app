class Dems2020::Cli

    def self.list_candidates
        Dems2020::Candidate.all.each_with_index do |candidate, index|
            puts "#{index + 1}. #{candidate.name}"
            
        end
    end
    
    def self.start
        system 'clear'
        puts ""
        puts ""
        puts "2020 DEMOCRATIC CANDIDATES FOR PRESIDENT"
        puts "========================================"
        Dems2020::Cli.list_candidates
        puts "Please enter the number of the candidate which you like to learn more about: "
        input_number = gets.to_i 
        selected_candidate = Dems2020::Candidate.find_by_index(input_number)
        puts ""
        puts ""
        puts ""
        puts "----------#{selected_candidate.name}----------"
        puts ""
        puts "The following is a quote from #{selected_candidate.name} explaining thier reason for running for president:"
        puts ""
        puts "'#{selected_candidate.quote}'"
        puts " - #{selected_candidate.name}"
        puts ""
        puts "For a summary of #{selected_candidate.name}'s campaign, Enter 'info'"
        puts "For the most recent news about #{selected_candidate.name}, Enter 'news'"
        second_input = gets.strip
        if second_input == "info"
            puts "===================================="
            puts ""
            puts selected_candidate.summary
            puts ""
            puts ""
            puts "Enter 'list' to return to the candidate list, or enter 'exit' to exit: "
            back_to_list_or_exit = gets.strip
                if back_to_list_or_exit == "list"
                    start
                else
                    puts "Thanks! Goodbye"
                    exit
                end
        elsif second_input == "news"
            puts selected_candidate.news
            puts "Enter 'list' to return to the candidate list, or enter 'exit' to exit: "
            if back_to_list_or_exit == "list"
                start
            else
                puts "Thanks! Goodbye"
                exit
            end
        else
            start
        end
    end

end