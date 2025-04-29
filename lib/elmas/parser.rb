# frozen_string_literal: true

module Elmas
  class Parser
    attr_accessor :parsed_json

    def initialize(json)
      @parsed_json = JSON.parse(json)
    rescue JSON::ParserError => e
      Elmas.error "There was an error parsing the response"
      Elmas.error "#{e.class}: #{e.message}"
      @parsed_json = ""
      @error_message = ""
    end

    def results
      result["results"] if result && result["results"]
    end

    def metadata
      result["__metadata"] if result && result["__metadata"]
    end

    def result
      parsed_json["d"]
    end

    def next_page_url
      result && result["__next"]
    end

    def error_message
      @error_message ||= ("#{parsed_json["error"]}: #{parsed_json["error_description"]}" if parsed_json["error"])
    end

    def first_result
      results[0]
    end
  end
end
