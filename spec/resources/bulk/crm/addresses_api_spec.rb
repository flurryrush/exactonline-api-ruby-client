require 'spec_helper'

describe Elmas::BulkCRMAddress do
  it "can initialize" do
    bulk_crm_address = Elmas::BulkCRMAddress.new
    expect(bulk_crm_address).to be_a(Elmas::BulkCRMAddress)
  end

  it "accepts attribute setter" do
    bulk_crm_address = Elmas::BulkCRMAddress.new
    bulk_crm_address.address_line3 = "78238"
    expect(bulk_crm_address.address_line3).to eq "78238"
  end

  it "returns value for getters" do
    bulk_crm_address = Elmas::BulkCRMAddress.new({ "AddressLine3" => "345" })
    expect(bulk_crm_address.address_line3).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_crm_address = Elmas::BulkCRMAddress.new({ this_does_not_exist: "Piet" })
    expect(bulk_crm_address.try(:address_line3)).to eq nil
  end



  let(:resource) { resource = Elmas::BulkCRMAddress.new(id: "12abcdef-1234-1234-1234-123456abcdef", address_line3: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Addresses(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Addresses?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Addresses?$filter=AddressLine3 eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:address_line3, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Addresses?$orderby=AddressLine3&$filter=AddressLine3 eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:address_line3, :id], order_by: :address_line3)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Addresses?$orderby=AddressLine3")
      resource.find_all(order_by: :address_line3)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Addresses?$select=AddressLine3")
      resource.find_all(select: [:address_line3])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Addresses?$select=AddressLine3")
      resource.find_by(select: [:address_line3])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Addresses?$select=AddressLine3,ID")
      resource.find_all(select: [:address_line3, :id])
    end
  end
end
