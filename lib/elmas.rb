# frozen_string_literal: true

require "elmas/version"
require "elmas/api"
require "elmas/config"
require "elmas/response"
require "elmas/client"
require "elmas/resource"
require "elmas/result_set"
require "elmas/sanitizer"
Dir[File.join(__dir__, 'elmas', 'resources', '*.rb')].each { require it }
require "active_support"
require "active_support/core_ext"

module Elmas
  extend Config

  def self.client(options = {})
    Elmas::Client.new(options)
  end

  # Delegate to Elmas::Client
  def self.method_missing(method, *args, &block)
    super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Elmas::Client
  def self.respond_to?(method, include_all = false)
    client.respond_to?(method, include_all) || super
  end

  def self.info(msg)
    logger.info(msg)
  end

  def self.error(msg)
    logger.error(msg)
  end
end
