array_of_destinations = [
  {"destination" => "Sydney", "price" => "200000"},
  {"destination" => "Perth", "price" => "220"},
  {"destination" => "Brisbane", "price" => "130"},
  {"destination" => "Gold_Coast", "price" => "400"},
  {"destination" => "Cairns", "price" => "250"},
  {"destination" => "Canberra", "price" => "260"},
  {"destination" => "Adelaide", "price" => "290"}
]
enter_value = "Cairns"
result = (array_of_destinations.find {|i| i["destination"]==enter_value}["price"]).to_i*2
puts "#{result}"
# array = []
# array_of_destinations.each do |destination_and_price|
#     array << destination_and_price["destination"]
# # puts "#{destination_and_price["destination"]} and price is #{destination_and_price["price"]}"
# end

# puts "#{array}"

# results = [
#    {"day"=>"2012-08-15", "name"=>"John", "calls"=>"5"},
#    {"day"=>"2012-08-15", "name"=>"Bill", "calls"=>"8"},
#    {"day"=>"2012-08-16", "name"=>"Bill", "calls"=>"11"},
# ]


# results.find {|i| i["day"] == "2012-08-15" and i["name"] == "Bill"}["calls"]