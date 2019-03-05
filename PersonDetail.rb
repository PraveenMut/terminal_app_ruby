class PersonDetail
    @@array_of_destinations = [
    {destination: 'Sydney', price: 200}, 
    {destination: 'Perth', price: 100}, 
    {destination: 'Sydney', price: 450},
    {destination: 'Gold_Coast', price: 560},
    {destination: 'Cairns', price: 140}, 
    {destination: 'Canberra', price: 400}, 
    {destination: 'Adelaide', price: 150}
    ]
    attr_accessor :name, :email
    def initialize(name)
        @name = name
        @email = ""
        @weight = ""
        @@city_destination = ""
    end

    def passenger_destination()
        puts "Where you want to travel"
        city_destination = gets().strip
        if(@@array_of_destinations.include?(city_destination))
            return @@city_destination
        else
            return "This option is not available"
        end
    end
    def luggage_weight(baggage_weight_integer)
        if baggage_weight_integer > 7 && baggage_weight_integer < 30
            return Sydney[:price]*1.5
        else 
            return 100
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



