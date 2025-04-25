require 'spec_helper'

describe Elmas::HourEntryRecentAccount do
  it "can initialize" do
    hour_entry_recent_account = Elmas::HourEntryRecentAccount.new
    expect(hour_entry_recent_account).to be_a(Elmas::HourEntryRecentAccount)
  end

  it "accepts attribute setter" do
    hour_entry_recent_account = Elmas::HourEntryRecentAccount.new
    hour_entry_recent_account.account_name = "78238"
    expect(hour_entry_recent_account.account_name).to eq "78238"
  end

  it "returns value for getters" do
    hour_entry_recent_account = Elmas::HourEntryRecentAccount.new({ "AccountName" => "345" })
    expect(hour_entry_recent_account.account_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    hour_entry_recent_account = Elmas::HourEntryRecentAccount.new({ this_does_not_exist: "Piet" })
    expect(hour_entry_recent_account.try(:account_name)).to eq nil
  end



  let(:resource) { resource = Elmas::HourEntryRecentAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", account_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/HourEntryRecentAccounts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/HourEntryRecentAccounts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/HourEntryRecentAccounts?$filter=AccountName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/HourEntryRecentAccounts?$orderby=AccountName&$filter=AccountName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_name, :id], order_by: :account_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/HourEntryRecentAccounts?$orderby=AccountName")
      resource.find_all(order_by: :account_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HourEntryRecentAccounts?$select=AccountName")
      resource.find_all(select: [:account_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/HourEntryRecentAccounts?$select=AccountName")
      resource.find_by(select: [:account_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HourEntryRecentAccounts?$select=AccountName,ID")
      resource.find_all(select: [:account_name, :id])
    end
  end
end
