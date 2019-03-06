require 'csv'

class Person
	attr_accessor :name, :email, :number_of_persons
	def initialize(name, email, number_of_persons)
        @name = name
        @email = email
        @number_of_persons = number_of_persons
	end
	def create_hash()
        @person_hash = {:name=>@name,:email=>@email,:number_of_persons=>@number_of_persons}
        return @person_hash
	end
end

####for testing####
#praveen = Person.new('praveen','subtle.ops@gmail.com',2)
#a_var = praveen.create_hash()
#p a_var

class TicketEngine
	attr_accessor :array_of_destinations
    attr_reader :infant_premium, :heavy_luggage_premium, :return_premium
    @@num_seats = 0
	def initialize()
		@array_of_destinations = [
        {destination: 'Sydney', price: 200, seats: 10}, 
        {destination: 'Perth', price: 100, seats: 10},
        {destination: 'Brisbane', price: 450, seats: 10},
        {destination: 'Gold_Coast', price: 560, seats: 10},
        {destination: 'Cairns', price: 140, seats: 10}, 
        {destination: 'Canberra', price: 400, seats: 10}, 
        {destination: 'Adelaide', price: 150, seats: 10}
    ]
    @infant_premium = 1.5
    @heavy_luggage_premium = 2.5
    @return_premium = 2
end

#Ask parents if infants are travelling with them and return new calculated price
def travelling_with_infant(price, user_response)
    yes_responses = ["YES","yes","y","Yes","Y"]
    no_responses = ["NO","no","n","No","N"]
    if yes_responses.include?(user_response)
        return (price * @infant_premium) - price
    elsif no_responses.include?(user_response)
        return 0
    end
end

#Methods to check if they have entered right city and return boolean
def destination_validator(user_response)
    found = @array_of_destinations.find {|hash| hash[:destination] == user_response}
    if(found)
        return found
    else
        return false
    end
end
#Methods to take price and user response and return new calculated price (for infants)
def return_calc(price, user_response)
    if (user_response == "return" || user_response == "Return" || user_response == "RETURN" || user_response == "r" || user_response == "R")
        return (price * @return_premium) - price
    elsif (user_response == "one way" || user_response == "ONE WAY" || user_response == "One Way")
        return 0
    end
end

#Methods to take price and user response and return new calculated price (for luggage weight)
def heavy_luggage_calc(price, user_response)
    if 7 < user_response && user_response < 30
        return (price * @heavy_luggage_premium) - price
    else
        return 0
    end
end

#Methods to take price and user response and return new calculated price (for luggage weight)
def calc_ticket_price(price, infant_response, luggage_response, return_response, passenger_quanity)
    total_price = travelling_with_infant(price, infant_response) + heavy_luggage_calc(price, luggage_response) + return_calc(price, return_response) + (passenger_quanity * price)
    return total_price
    # return travelling_with_infant(price, infant_response), heavy_luggage_calc(price, luggage_response), return_calc(price, return_response), (passenger_quanity * price)
end
###problems arose with this method######
# def remaining_seats(hash_of_destination, number_of_passengers)
#     seats_remaining = hash_of_destination[:seats] - number_of_passengers
#     if (seats_remaining < 0)
#         return false
#     end
#     hash_of_destination[:seats] = seats_remaining
#     return hash_of_destination
# end
end



#testing the engine for inputs
#new_ticket_engine = TicketEngine.new()
# p new_ticket_engine.travelling_with_infant(200,"n")
# p new_ticket_engine.return_calc(200,"return")
# p new_ticket_engine.heavy_luggage_calc(200,1)
# p new_ticket_engine.calc_ticket_price(200,"n",1,"return",1)
# p new_ticket_engine.remaining_seats({destination: 'Sydney', price: 200, seats: 10}, 6)
# p new_ticket_engine.array_of_destinations()
# def write_to_file()
# get the hash of passenger
# get the hash of ticket
# headers => (name, email, number of passengers, price, seats available)
# write to with a+ flag
# close file

#Method to write customer ticket in csv file
def write_file(email_address, hashed_passenger)
    filename = email_address + ".csv"
    if(!File.exist?(filename))
        CSV.open(filename,"a+",headers: hashed_passenger.keys()) do |csv|
            csv << hashed_passenger.keys()
            csv << hashed_passenger.values()
        end
    else
        CSV.open(filename, "a", headers: hashed_passenger.keys()) do |csv|
        csv << hashed_passenger.values()
        end
    end
end

# write_file("subtle.ops@gmail.com",{:name=>"praveen", :email=>"subtle.ops@gmail.com", :number_of_persons=>2,:price=>200})

#Main method
def main()
	main_ticket_engine = TicketEngine.new()
	print "------------------------------------\n"
	print " \n"
	print "WELCOME TO THE AIR TICKET GENERATOR\n"
	print " \n"
	print "------------------------------------\n"
    print "Hi, What's your name?\n"
	name_of_passenger = gets().strip()
	print "Your email address?\n"
    email_address = gets.strip()
    while(!email_address.include?("@"))
        print "Please enter correct email id \n"
        email_address = gets.strip()
    end
    print "Fantastic! Thanks for that. How many passengers are travelling? Please enter integer value only\n"
    number_of_passengers = gets().strip().to_i
	passenger = Person.new(name_of_passenger, email_address, number_of_passengers)
	hashed_passenger = passenger.create_hash()
	print "Thanks. Where are you heading off to?\n"
	passenger_destination = gets().strip().capitalize()
	while(!main_ticket_engine.destination_validator(passenger_destination))
		print "Sorry we don't have that destination at the moment!\n Please enter another destination\n"
        passenger_destination = gets().strip()
	end
    destination_hash = main_ticket_engine.destination_validator(passenger_destination)
    price_of_destination = destination_hash[:price]
	print "Ok Great! Thanks for that\n"
	print "Are you travelling with any infants?\n"
	infant_response = gets().strip()
	print "Great. How much luggage are you carrying?\n"
	luggage_response = gets().strip().to_i
	print "Cheers Is it a return flight you looking for or one way?\n"
	return_response = gets().strip()
    print "Whipping up the ticket for you!\n"
    total_price = main_ticket_engine.calc_ticket_price(price_of_destination, infant_response, luggage_response, return_response, hashed_passenger[:number_of_persons])
    hashed_passenger[:total_cost_price] = total_price
    write_file(email_address, hashed_passenger)
    print "-----------------------------\n"
    print " \n"
    print "Thank you for booking a ticket with us!\n\nYour tickets are in saved file under your email address!\n\nHave a safe flight!\n\nHope to see you again!\n\n"
    print " \n"
    print "-----------------------------\n"
end

main()