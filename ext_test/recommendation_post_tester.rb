require 'net/http'
require 'json'

# Define the request parameters
puts "consultation_request_id ? : "
consultation_request_id = gets.chomp
puts "recommended treatments ? : "
recommendation_text = gets.chomp
request_params = {
	recommendation_text: recommendation_text
}
consultation_request_id = 3

# Convert the request parameters to JSON
request_body = request_params.to_json

# Set the URL of the controller action
url = URI.parse("http://localhost:3000/consultation_requests/#{consultation_request_id}/recommendations")

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