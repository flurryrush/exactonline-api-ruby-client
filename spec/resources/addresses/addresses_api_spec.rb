require 'spec_helper'

describe Elmas::Address do
  it "can initialize" do
    address = Elmas::Address.new
    expect(address).to be_a(Elmas::Address)
  end

  it "accepts attribute setter" do
    address = Elmas::Address.new
    address.address_line1 = "1600 Pennsylvania Ave."
    expect(address.address_line1).to eq "1600 Pennsylvania Ave."
  end

  it "returns value for getters" do
    address = Elmas::Address.new({ address_line1: "1600 Pennsylvania Ave." })
    expect(address.address_line1).to eq "1600 Pennsylvania Ave."
  end

  it "crashes and burns when getting an unset attribute" do
    address = Elmas::Address.new({ address_line1: "1600 Pennsylvania Ave."  })
    expect(address.try(:birth_name)).to eq nil
  end

  it "does not allow to set an invalid attribute" do
    address = Elmas::Address.new
    address.airplane = "Boeing 777"
    expect(address.airplaine).to eq nil
  end
end
