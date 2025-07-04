# frozen_string_literal: true

module Elmas
  module Parser
    attr_accessor :parsed_data

    def results
      result["results"] if result && result["results"]
    end

    def metadata
      result["__metadata"] if result && result["__metadata"]
    end

    def result
      parsed_data["d"]
    end

    def next_page_url
      result && result["__next"]
    end

    def error_message
      @error_message ||= ("#{parsed_data["error"]}: #{parsed_data["error_description"]}" if parsed_data["error"])
    end

    def first_result
      results[0]
    end
  end
end
