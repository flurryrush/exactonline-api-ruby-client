# frozen_string_literal: true

require File.expand_path("parser", __dir__)

module Elmas
  class JsonParser
    include Elmas::Parser

    def initialize(json)
      @parsed_data = JSON.parse(json)
    rescue JSON::ParserError => e
      Elmas.error "There was an error parsing the response"
      Elmas.error "#{e.class}: #{e.message}"
      @parsed_data = ""
      @error_message = ""
    end
  end
end
