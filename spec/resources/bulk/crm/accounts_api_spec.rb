require 'spec_helper'

describe Elmas::BulkCRMAccount do
  it "can initialize" do
    bulk_crm_account = Elmas::BulkCRMAccount.new
    expect(bulk_crm_account).to be_a(Elmas::BulkCRMAccount)
  end

  it "accepts attribute setter" do
    bulk_crm_account = Elmas::BulkCRMAccount.new
    bulk_crm_account.address_source = "78238"
    expect(bulk_crm_account.address_source).to eq "78238"
  end

  it "returns value for getters" do
    bulk_crm_account = Elmas::BulkCRMAccount.new({ "AddressSource" => "345" })
    expect(bulk_crm_account.address_source).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_crm_account = Elmas::BulkCRMAccount.new({ this_does_not_exist: "Piet" })
    expect(bulk_crm_account.try(:address_source)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_crm_account = Elmas::BulkCRMAccount.new(name: "Name")
    expect(bulk_crm_account.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_crm_account = Elmas::BulkCRMAccount.new
    expect(bulk_crm_account.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkCRMAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", address_source: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Accounts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Accounts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Accounts?$filter=AddressSource eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:address_source, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Accounts?$orderby=AddressSource&$filter=AddressSource eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:address_source, :id], order_by: :address_source)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Accounts?$orderby=AddressSource")
      resource.find_all(order_by: :address_source)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Accounts?$select=AddressSource")
      resource.find_all(select: [:address_source])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Accounts?$select=AddressSource")
      resource.find_by(select: [:address_source])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Accounts?$select=AddressSource,ID")
      resource.find_all(select: [:address_source, :id])
    end
  end
end
