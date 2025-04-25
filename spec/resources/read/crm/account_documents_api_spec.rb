require 'spec_helper'

describe Elmas::AccountDocument do
  it "can initialize" do
    account_document = Elmas::AccountDocument.new
    expect(account_document).to be_a(Elmas::AccountDocument)
  end

  it "accepts attribute setter" do
    account_document = Elmas::AccountDocument.new
    account_document.account = "78238"
    expect(account_document.account).to eq "78238"
  end

  it "returns value for getters" do
    account_document = Elmas::AccountDocument.new({ "Account" => "345" })
    expect(account_document.account).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    account_document = Elmas::AccountDocument.new({ this_does_not_exist: "Piet" })
    expect(account_document.try(:account)).to eq nil
  end



  let(:resource) { resource = Elmas::AccountDocument.new(id: "12abcdef-1234-1234-1234-123456abcdef", account: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/crm/AccountDocuments(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/crm/AccountDocuments?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/crm/AccountDocuments?$filter=Account eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/crm/AccountDocuments?$orderby=Account&$filter=Account eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account, :id], order_by: :account)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/crm/AccountDocuments?$orderby=Account")
      resource.find_all(order_by: :account)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/AccountDocuments?$select=Account")
      resource.find_all(select: [:account])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/crm/AccountDocuments?$select=Account")
      resource.find_by(select: [:account])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/AccountDocuments?$select=Account,ID")
      resource.find_all(select: [:account, :id])
    end
  end
end
