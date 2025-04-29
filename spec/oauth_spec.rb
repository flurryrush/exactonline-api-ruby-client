require 'spec_helper'

describe Elmas::OAuth do
  let(:client_id) { "client_id" }
  let(:client_secret) { "client_secret" }
  let(:redirect_uri) { "https://test.example" }
  let(:base_url) { "https://start.exactonline.nl" }
  let(:endpoint) { "api/oauth2" }

  let(:url_with_endpoint) { "#{base_url}/#{endpoint}"}

  before :each do
    Elmas.configure do |config|
      config.client_id = client_id
      config.client_secret = client_secret
      config.redirect_uri = redirect_uri
      config.base_url = base_url
      config.endpoint = endpoint
    end
  end

  it "sets up the authorize url" do
    url = "#{url_with_endpoint}/auth?client_id=#{client_id}&redirect_uri=#{CGI.escape(redirect_uri)}&response_type=code&force_login=0"
    expect(Elmas.authorize_url).to eq(url)
  end

  it "retrieves an access and refresh token with a code" do
    response_json = {
      access_token: "AAEAAGxWulSxg7ZT-MPQMWOqQmssMzGa",
      token_type: "Bearer",
      expires_in: "600",
      refresh_token: "Gcp7!IAAAABh4eI8DgkxRyGGyHPLLOz3y9Ss"
    }.to_json
    stub_request(:post, "#{url_with_endpoint}/token").
      with(
        body: {
          "client_id": client_id,
          "client_secret": client_secret,
          "code": "XTzM!IAAAACbPTzQJXwFhM",
          "grant_type": "authorization_code",
          "redirect_uri": redirect_uri
        }
      ).
      to_return(status: 200, body: response_json)
    response = Elmas.get_access_token("XTzM!IAAAACbPTzQJXwFhM")
    expect(response).to be_a(Elmas::OauthResponse)
    expect(response.access_token).to eq("AAEAAGxWulSxg7ZT-MPQMWOqQmssMzGa")
    expect(response.refresh_token).to eq("Gcp7!IAAAABh4eI8DgkxRyGGyHPLLOz3y9Ss")
    expect(response.expires_in).to eq(600)
  end

  it "retrieves an access and refresh token with a refresh token" do
    response_json = {
      access_token: "AAEAABIKSw2E5nHI8lhwdM4iEV4RPdxLgThZj",
      token_type: "Bearer",
      expires_in: "600",
      refresh_token: "__1P!IAAAACpjBagWscm76YIGMY3526T3dIK"
    }.to_json
    stub_request(:post, "#{url_with_endpoint}/token").
      with(
        body: {
          client_id: client_id,
          client_secret: client_secret,
          grant_type: "refresh_token",
          refresh_token: "token"
        }
      ).
      to_return(status: 200, body: response_json)
    response = Elmas.get_refresh_token("token")
    expect(response).to be_a(Elmas::OauthResponse)
    expect(response.access_token).to eq("AAEAABIKSw2E5nHI8lhwdM4iEV4RPdxLgThZj")
    expect(response.refresh_token).to eq("__1P!IAAAACpjBagWscm76YIGMY3526T3dIK")
    expect(response.expires_in).to eq(600)
  end

  it "handles errors when requesting an access and refresh token" do
    response_json = { error: "invalid_request", error_description: "Handle could not be extracted" }.to_json
    stub_request(:post, "#{url_with_endpoint}/token").
      with(
        body: {
          "client_id": "client_id",
          "client_secret": "client_secret",
          "code": "",
          "grant_type": "authorization_code",
          "redirect_uri": redirect_uri
        }
      ).
      to_return(status: 400, body: response_json)
    expect { response = Elmas.get_access_token("") }.to raise_exception(Elmas::BadRequestException).with_message(/Handle could not be extracted/)
  end
end
