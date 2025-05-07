# frozen_string_literal: true

require "mechanize"
require "uri"
require "json"

require File.expand_path("utils", __dir__)
require File.expand_path("response", __dir__)

# from https://developers.exactonline.com/#Example retrieve access token.html

# This whole class is going to be replaced due to Exact Online's new policies.
# https://support.exactonline.com/community/s/knowledge-base#All-All-HNO-Concept-general-security-gen-auth-totpc

module Elmas
  module OAuth
    def token_path
      "/api/oauth2/token"
    end

    def token_uri
      "#{base_url}#{token_path}"
    end

    def auth_path
      "/api/oauth2/auth"
    end

    def auth_uri
      "#{base_url}#{auth_path}"
    end

    def authorized?
      # Do a test call, return false if 401 or any error code
      response = Elmas.get("/Current/Me", no_division: true)
      response.results.first.present?
    rescue BadRequestException
      Elmas.error "Not yet authorized"
      false
    end

    def authorize_division
      get("/Current/Me", no_division: true).results.first.current_division
    end

    # Return URL for OAuth authorization
    def authorize_url(options = {})
      options[:redirect_uri] ||= redirect_uri
      options[:response_type] ||= "code"
      options[:force_login] ||= 0
      params = authorization_params.merge(options)
      uri = URI(auth_uri)
      uri.query = URI.encode_www_form(params)
      uri.to_s
    end

    # Return an access token from authorization
    def get_access_token(code, _options = {})
      conn = Faraday.new(url: base_url) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
      params = access_token_params(code)
      res = conn.post do |req|
        req.url token_path
        req.body = params
        req.headers["Accept"] = "application/json"
        req.headers["Content-Type"] = "application/x-www-form-urlencoded"
      end
      OauthResponse.new(res)
    end

    # Return an access token from authorization via refresh token
    def get_refresh_token(refresh_token)
      conn = Faraday.new(url: base_url) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
      params = refresh_access_token_params(refresh_token)
      res = conn.post do |req|
        req.url token_path
        req.body = params
        req.headers["Accept"] = "application/json"
        req.headers["Content-Type"] = "application/x-www-form-urlencoded"
      end
      OauthResponse.new(res)
    end

    private

    def authorization_params
      {
        client_id: client_id
      }
    end

    def access_token_params(code)
      {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: "authorization_code",
        code: code,
        redirect_uri: redirect_uri
      }
    end

    def refresh_access_token_params(code)
      {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: "refresh_token",
        refresh_token: code
      }
    end
  end

  class OauthResponse < Response
    def access_token
      parsed.parsed_json["access_token"]
    end

    def refresh_token
      parsed.parsed_json["refresh_token"]
    end

    def expires_in
      parsed.parsed_json["expires_in"].to_i
    end
  end
end
