require 'spec_helper'

describe Elmas::SyncCRMAddress do
  it "can initialize" do
    sync_crm_address = Elmas::SyncCRMAddress.new
    expect(sync_crm_address).to be_a(Elmas::SyncCRMAddress)
  end

  it "accepts attribute setter" do
    sync_crm_address = Elmas::SyncCRMAddress.new
    sync_crm_address.account_name = "78238"
    expect(sync_crm_address.account_name).to eq "78238"
  end

  it "returns value for getters" do
    sync_crm_address = Elmas::SyncCRMAddress.new({ "AccountName" => "345" })
    expect(sync_crm_address.account_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_crm_address = Elmas::SyncCRMAddress.new({ this_does_not_exist: "Piet" })
    expect(sync_crm_address.try(:account_name)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncCRMAddress.new(id: "12abcdef-1234-1234-1234-123456abcdef", account_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/CRM/Addresses(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/CRM/Addresses?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/CRM/Addresses?$filter=AccountName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/CRM/Addresses?$orderby=AccountName&$filter=AccountName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_name, :id], order_by: :account_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/CRM/Addresses?$orderby=AccountName")
      resource.find_all(order_by: :account_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/CRM/Addresses?$select=AccountName")
      resource.find_all(select: [:account_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/CRM/Addresses?$select=AccountName")
      resource.find_by(select: [:account_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/CRM/Addresses?$select=AccountName,ID")
      resource.find_all(select: [:account_name, :id])
    end
  end
end
