require_relative 'PersonDetail.rb'

def main()
    puts "Welcome to the Air Ticketing system. Please Enter your name"
    passenger_name = gets().strip
    passenger = PersonDetail.new(passenger_name)
    customer_name = passenger.name
    puts "Welcome #{customer_name}"

    puts "Where you want to travel"
    passenger.passenger_destination

    puts "Do you have any infants travelling with you"
    infants_check = gets().strip
    puts "#{passenger.has_infant?(infants_check)}"
end
main 