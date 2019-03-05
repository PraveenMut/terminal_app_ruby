require_relative 'PersonDetail.rb'

def main()
    puts "Welcome to the Air Ticketing system. Please Enter your name"
    passenger_name = gets().strip
    passenger = PersonDetail.new(passenger_name)
    customer_name = passenger.name
    puts "Welcome #{customer_name}"
    available_option = passenger.passenger_destination
    puts "#{available_option}"

    puts "Enter total weight of luggages you want to carry integer only"
    passenger_luggage_weight = gets().strip.to_i
    check_weight = passenger.luggage_weight(passenger_luggage_weight)
    puts "#{check_weight}"

    puts "Do you have any infants travelling with you"
    infants_check = gets().strip
    puts "#{passenger.has_infant?(infants_check)}"
end

main 