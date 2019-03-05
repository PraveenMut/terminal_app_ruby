class Ticket
    @@total_number_of_tickets_sold = 0
    attr_accessor :destination
    def initialize(destination)
        @destination = destination
        @email = ""
        @available_seats = 10
        @@total_number_of_tickets_sold += 1
    end

    def create_a_file_and_save_ticket()
    end

    def max_seats_available()
    end
    def total_number_of_tickets_sold()
        return @@total_number_of_tickets_sold
    end

    def ticket_payment()
        
    end
end