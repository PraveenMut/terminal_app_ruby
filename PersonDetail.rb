class PersonDetail

@@array_of_destinations = [
  {"destination" => "Sydney", "price" => "200"},
  {"destination" => "Perth", "price" => "220"},
  {"destination" => "Gold_Coast", "price" => "400"},
  {"destination" => "Cairns", "price" => "250"},
  {"destination" => "Brisbane", "price" => "130"},
  {"destination" => "Canberra", "price" => "260"},
  {"destination" => "Adelaide", "price" => "290"}
]

#   array_of_destinations.each do |destination_and_price|
#     puts "#{destination_and_price["destination"]} and Phone Number: #{destination_and_price["price"]}"
#   end
    attr_accessor :name, :email
    def initialize(name)
        @name = name
        @email = ""
        @weight = ""
        @city_destination = []
    end

    def luggage_weight(baggage_weight_in_integer)
        if (baggage_weight_in_integer > 7 && baggage_weight_in_integer < 30)
            return 100
            #####cannot call method inside the other method
        else
            return 200
        end
    end

    def ticket_payment_if_with_infant_or_weight_more_than_7kg()
        @result = (@@array_of_destinations.find {|i| i["destination"]==@enter_value}["price"]).to_i*1.5
        return "#{@result}"
    end

    def passenger_destination
    city_option_to_travel = []
    @enter_city = gets().strip
    @@array_of_destinations.each do |city_to_travel|
        city_option_to_travel << city_to_travel["destination"]
    end
    if city_option_to_travel.include?(@enter_city)
        puts "Please go ahead to book the ticket"
        puts "Enter total weight of luggage you want to carry with you. please note integer only"
        passenger_luggage_weight = gets().strip.to_i
        check_weight =luggage_weight(passenger_luggage_weight)
        puts "#{check_weight}"
        luggage_weight(check_weight)
    else
        puts "Thanks for visiting our Application"
        puts "Sorry we do not have service available for #{@enter_city} "
    end
    end
    
    def has_infant?(bool_infant_val)
        if (bool_infant_val == 'Y' || bool_infant_val == 'y' || bool_infant_val == 'yes' || bool_infant_val == 'YES')
            return true
        elsif (bool_infant_val == 'n' || bool_infant_val == 'N' || bool_infant_val == 'NO' || bool_infant_val == 'No')
            return false
        end
    end
end 



