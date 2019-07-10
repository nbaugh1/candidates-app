class Dems2020::Cli

    def self.list_candidates
        Dems2020::Candidate.all.each_with_index do |candidate, index|
            puts "#{index + 1}. #{candidate.name}"
        end
    end
    
    def self.start
        puts ""
        puts ""
        puts "DEMOCRATIC 2020 CANDIDATES FOR PRESIDENT"
        puts "======================================"
        Dems2020::Cli.list_candidates
        puts "Please enter the number of the candidate which you like to learn more about: "
        input_number = gets.to_i 
        selected_candidate = Dems2020::Candidate.find_by_index(input_number)
        puts ""
        puts ""
        puts ""
        puts "----------#{selected_candidate.name}----------"
        puts ""
        puts "The following is a quote from '#{selected_candidate.name}' explaining thier reason for running for president:"
        puts ""
        puts "#{selected_candidate.quote}"
        puts " - #{selected_candidate.name}"
        puts ""
        puts "Would you like to learn more about #{selected_candidate.name}'s campaign? Enter y or n"
        second_input = gets.strip
        if second_input == "y"
            puts "===================================="
            puts ""
            puts selected_candidate.summary
            puts ""
            puts ""
            puts "Enter 'list' to return to the candidate list, or enter 'exit' to exit: "
            back_to_list_or_exit = gets.strip
                if back_to_list_or_exit == "list"
                    start
                else back_to_list_or_exit == "exit"
                    puts "Thanks! Goodbye"
                    exit
                end
        else 
            start
        end
    end

end