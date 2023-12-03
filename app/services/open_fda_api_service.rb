require 'httparty'

class OpenFdaApiService
  include HTTParty
  base_uri 'https://api.fda.gov'

  def self.get_diseases_by_keywords(keywords)
    api_key = 'iffzeqOFcUgD6ZW5ldVKV0pbYvQpf9RxC1pftIPa'   ## this is my own API key just for testing. it may expire soon ;)
    endpoint = '/drug/event.json'

    response = get(endpoint, query: { search: "patient.reaction.reactionmeddrapt:#{keywords}", api_key: api_key })

    if response.success?
      response.parsed_response['results']
    end
  end
end