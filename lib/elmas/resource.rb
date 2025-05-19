# frozen_string_literal: true

require File.expand_path("utils", __dir__)
require File.expand_path("exception", __dir__)
require File.expand_path("uri", __dir__)
require File.expand_path("sanitizer", __dir__)

module Elmas
  module Resource
    include UriMethods
    include Sanitizer

    attr_accessor :attributes, :url
    attr_reader :response

    def initialize(attributes = {})
      @attributes = Utils.normalize_hash(attributes)
      @filters = []
      @query = []
    end

    def id
      @attributes[:id]
    end

    def find_all(options = {})
      @order_by = options[:order_by]
      @select = options[:select]
      response = get(uri(%i[order select]))
      response&.results
    end

    # Pass filters in an array, for example 'filters: [:id, :name]'
    def find_by(options = {})
      @filters = options[:filters]
      @order_by = options[:order_by]
      @select = options[:select]
      response = get(uri(%i[order select filters]))
      response&.results
    end

    def find
      return nil unless id?

      response = get(uri([:id]))
      response&.results&.first
    end

    # Normally use the url method (which applies the filters) but sometimes you only want to use the base path or other paths
    def get(uri = self.uri)
      @response = if no_division?
        Elmas.get(URI.decode_www_form_component(uri.to_s), { no_division: true })
      else
        Elmas.get(URI.decode_www_form_component(uri.to_s))
      end
    end

    def valid?(validate: true)
      return true unless validate

      @invalid_attributes = mandatory_attributes.each_with_object([]) do |attribute, acc|
        acc << attribute if @attributes[attribute].blank?
      end
      @invalid_attributes.none?
    end

    def id?
      !@attributes[:id].nil?
    end

    def save(validate: true)
      attributes_to_submit = sanitize
      if valid?(validate: validate)
        return @response = Elmas.post(base_path, params: attributes_to_submit) unless id?

        @response = Elmas.put(basic_identifier_uri, params: attributes_to_submit)
      else
        Elmas.error("Validation: #{self.class.name}, attributes: #{@attributes.inspect}, mandatory_attributes: #{mandatory_attributes}")
        raise Elmas::ValidationException, @invalid_attributes
      end
    end

    def delete
      return nil unless id?

      Elmas.delete(basic_identifier_uri)
    end

    # Getter/Setter for resource
    def method_missing(method, *args, &block)
      yield if block
      if /^(\w+)=$/ =~ method
        set_attribute($1, args[0])
      else
        nil unless @attributes[method.to_sym]
      end
      @attributes[method.to_sym]
    end

    private

    def set_attribute(attribute, value)
      @attributes[attribute.to_sym] = value if valid_attribute?(attribute)
    end

    def valid_attribute?(attribute)
      valid_attributes.include?(attribute.to_sym)
    end

    def valid_attributes
      @valid_attributes ||= mandatory_attributes.inject(other_attributes, :<<)
    end
  end
end
