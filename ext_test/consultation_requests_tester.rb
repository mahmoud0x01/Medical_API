require 'net/http'
require 'json'

puts "what symptoms do u have ? "
text = gets.chomp
puts "full_name ? : "
full_name = gets.chomp
puts "date_of_birth ? : "
date_of_birth = gets.chomp
puts "phone_number ? :  "
phone_number = gets.chomp
puts "email ? : "
email = gets.chomp
# Define the request parameters
request_params = {
    text: text,
    full_name: full_name ,
    date_of_birth: date_of_birth ,
    phone_number: phone_number ,
    email: email
}

# Convert the request parameters to JSON
request_body = request_params.to_json

# Set the URL of the controller action
url = URI.parse('http://localhost:3000/consultation_requests')

# Create the HTTP request
http = Net::HTTP.new(url.host, url.port)
request = Net::HTTP::Post.new(url.path, { 'Content-Type' => 'application/json' })
request.body = request_body

# Send the request and get the response
response = http.request(request)

# Parse the response body as JSON
response_body = JSON.parse(response.body)

# Print the response
puts response_body