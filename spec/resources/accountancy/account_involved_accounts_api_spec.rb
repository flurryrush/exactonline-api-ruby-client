require 'spec_helper'

describe Elmas::AccountInvolvedAccount do
  it "can initialize" do
    account_involved_account = Elmas::AccountInvolvedAccount.new
    expect(account_involved_account).to be_a(Elmas::AccountInvolvedAccount)
  end

  it "accepts attribute setter" do
    account_involved_account = Elmas::AccountInvolvedAccount.new
    account_involved_account.account_name = "78238"
    expect(account_involved_account.account_name).to eq "78238"
  end

  it "returns value for getters" do
    account_involved_account = Elmas::AccountInvolvedAccount.new({ "AccountName" => "345" })
    expect(account_involved_account.account_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    account_involved_account = Elmas::AccountInvolvedAccount.new({ this_does_not_exist: "Piet" })
    expect(account_involved_account.try(:account_name)).to eq nil
  end



  let(:resource) { resource = Elmas::AccountInvolvedAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", account_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("accountancy/AccountInvolvedAccounts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("accountancy/AccountInvolvedAccounts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("accountancy/AccountInvolvedAccounts?$filter=AccountName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("accountancy/AccountInvolvedAccounts?$orderby=AccountName&$filter=AccountName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_name, :id], order_by: :account_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("accountancy/AccountInvolvedAccounts?$orderby=AccountName")
      resource.find_all(order_by: :account_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("accountancy/AccountInvolvedAccounts?$select=AccountName")
      resource.find_all(select: [:account_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("accountancy/AccountInvolvedAccounts?$select=AccountName")
      resource.find_by(select: [:account_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("accountancy/AccountInvolvedAccounts?$select=AccountName,ID")
      resource.find_all(select: [:account_name, :id])
    end
  end
end
