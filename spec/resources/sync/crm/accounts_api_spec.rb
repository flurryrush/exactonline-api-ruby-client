require 'spec_helper'

describe Elmas::SyncCRMAccount do
  it "can initialize" do
    sync_crm_account = Elmas::SyncCRMAccount.new
    expect(sync_crm_account).to be_a(Elmas::SyncCRMAccount)
  end

  it "accepts attribute setter" do
    sync_crm_account = Elmas::SyncCRMAccount.new
    sync_crm_account.reseller_code = "78238"
    expect(sync_crm_account.reseller_code).to eq "78238"
  end

  it "returns value for getters" do
    sync_crm_account = Elmas::SyncCRMAccount.new({ "ResellerCode" => "345" })
    expect(sync_crm_account.reseller_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_crm_account = Elmas::SyncCRMAccount.new({ this_does_not_exist: "Piet" })
    expect(sync_crm_account.try(:reseller_code)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_crm_account = Elmas::SyncCRMAccount.new(name: "Name")
    expect(sync_crm_account.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_crm_account = Elmas::SyncCRMAccount.new
    expect(sync_crm_account.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncCRMAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", reseller_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/CRM/Accounts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/CRM/Accounts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/CRM/Accounts?$filter=ResellerCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:reseller_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/CRM/Accounts?$orderby=ResellerCode&$filter=ResellerCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:reseller_code, :id], order_by: :reseller_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/CRM/Accounts?$orderby=ResellerCode")
      resource.find_all(order_by: :reseller_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/CRM/Accounts?$select=ResellerCode")
      resource.find_all(select: [:reseller_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/CRM/Accounts?$select=ResellerCode")
      resource.find_by(select: [:reseller_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/CRM/Accounts?$select=ResellerCode,ID")
      resource.find_all(select: [:reseller_code, :id])
    end
  end
end
