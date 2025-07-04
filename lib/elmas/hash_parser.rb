# frozen_string_literal: true

require File.expand_path("parser", __dir__)

module Elmas
  class HashParser
    include Elmas::Parser

    def initialize(data)
      raise "data must be a hash" unless data.is_a?(Hash)
      @parsed_data = data
    rescue => e
      Elmas.error "There was an error parsing the response"
      Elmas.error "#{e.class}: #{e.message}"
      @parsed_data = ""
      @error_message = ""
    end
  end
end
