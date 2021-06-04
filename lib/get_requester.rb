# Write your code here
require 'net/http'
require 'open-uri'
require 'json'

class GetRequester

    URL = "https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json"

    def get_response_body
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end
    
    def parse_json
        # we use the JSON library to parse the API response into nicely formatted JSON
        programs = JSON.parse(self.get_response_body)
        programs.collect do |program|
          program["name"]  
        end
    end 

end

# programs = GetRequester.new.get_response_body
# puts programs

programs = GetRequester.new
puts programs.parse_json.uniq 