@@array_of_destinations = [Sydney, Perth, Brisbane, Gold_Coast, Cairns, Canberra, Adelaide]
$Sydney = {price: 200}
$Perth = {price: 450}
$Brisbane = {price: 120}
$Gold_Coast = {price: 180}
$Cairns = {price: 250}
$Canberra = {price: 100}
$Adelaide = {price: 110}

class PersonDetail
    attr_accessor :name, :email
    def initialize(name)
        @name = name
        @email = ""
    end

    def passenger_destination()
        puts "Where you want to travel"
        city_destination = gets().strip
        array_of_destinations.each do |list|
            if(city_destination == list)
                return city_destination
                else
            end
                puts "we dont have this option available for you"
        end
    end

    def luggage_weight()
    end

    def has_infant?()
    end
end

puts "Welcome to the Air Ticketing system. Please Enter your name"
passenger_name = gets().strip
passenger = PersonDetail.new(passenger_name)
customer_name = passenger.name
puts "Welcome #{customer_name}"
available_option = customer_name.passenger_destination
puts "#{available_option}"