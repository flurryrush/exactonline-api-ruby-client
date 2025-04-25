require 'spec_helper'

describe Elmas::Account do
  it "can initialize" do
    account = Elmas::Account.new
    expect(account).to be_a(Elmas::Account)
  end

  it "accepts attribute setter" do
    account = Elmas::Account.new
    account.website = "website"
    expect(account.website).to eq "website"
  end

  it "returns value for getters" do
    account = Elmas::Account.new({ "Website" => "www.google.com" })
    expect(account.website).to eq "www.google.com"
  end

  it "crashes and burns when getting an unset attribute" do
    account = Elmas::Account.new({ name: "Piet" })
    expect(account.try(:birth_name)).to eq nil
  end

  it "does not allow to set an invalid attribute" do
    account = Elmas::Account.new
    account.airplane = "Boeing 777"
    expect(account.airplaine).to eq nil
  end

  it "is valid with mandatory attributes" do
    account = Elmas::Account.new(
      name: "Piet", code: "123", email: "piet@mondriaan.nl", status: "C", type: "A"
    )
    expect(account.valid?).to eq true
  end

  it "is not valid without mandatory attributes" do
    account = Elmas::Account.new
    expect(account.valid?).to eq false
  end

  it "is valid without mandatory attributes" do
    account = Elmas::Account.new
    expect(account.valid?(validate: false)).to eq true
  end
end
