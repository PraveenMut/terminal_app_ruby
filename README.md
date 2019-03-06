# Flight Ticket Estimator

This application allows an user to accurately estimate the ticket cost of a domestic flight in Australia and then generate a ticket based upon user given values. This is based on hypothetical flight scenarios which simulate a simplified flight price calculation engine where user inputs are passed in and an output of the Passenger Information (Passenger Name, Email), the number of seats taken and the total price to a .csv file where the user is able to access their details in the outputted text file. 

The Available destinations are most Australian Capital Cities: Sydney, Perth, Adelaide, Gold Coast, Hobart

# Design Considerations

- Due to the time constraints of this project, we opted in creating a hypothetical price determiner rather than from accessing through multiple APIs from a plethora of resources.

- We opted for a standard practice of modularising functions and then using this to create a synthetic microfunctions/microservices structure which are then all passed into a main function where all of the main inputs are obtained and then evaluated with the pased in functions.

- Two main classes were built as a result from this separation of concerns architecture. The first class dealt with the generation of the identity of the passenger with their associated details and the second class dealt with the calculations and the logic of calculation of the price of the ticket.

- The main class executes the main processes of the application, as a "front-end" and then stores the user inputs in relevant bindings for use in the calculation "Engine". The main function also calls an external write to csv method to write the results into a csv that is identified by their email address (which should for all intensive purposes should be an unique identifier). This stores the Customer's Name, Email Address, The Number of Passengers booked and the price of the ticket.

# Input Data Required

The overall input data required for the program to function are:
- Name
- Email
- The number of passengers travelling the passenger (the number of tickets to book)
- Valid Travel Destination (Valid Destinations)
- If the passenger is travelling with the infant
- If the passenger is carrying heavy lugguage
- If the person requires a return ticket or an one-way ticket

# Usage of Program

- Example Text 3

# Example

- Example Text 4

# Trello

- Example Text 5

# Slack

- Example Text 6

# Issues

- Example Text 7

# Limitations

- Example Text 8