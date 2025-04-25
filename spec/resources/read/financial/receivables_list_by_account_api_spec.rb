require 'spec_helper'

describe Elmas::ReceivablesListByAccount do
  it "can initialize" do
    receivables_list_by_account = Elmas::ReceivablesListByAccount.new
    expect(receivables_list_by_account).to be_a(Elmas::ReceivablesListByAccount)
  end

  it "accepts attribute setter" do
    receivables_list_by_account = Elmas::ReceivablesListByAccount.new
    receivables_list_by_account.amount = "78238"
    expect(receivables_list_by_account.amount).to eq "78238"
  end

  it "returns value for getters" do
    receivables_list_by_account = Elmas::ReceivablesListByAccount.new({ "Amount" => "345" })
    expect(receivables_list_by_account.amount).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    receivables_list_by_account = Elmas::ReceivablesListByAccount.new({ this_does_not_exist: "Piet" })
    expect(receivables_list_by_account.try(:amount)).to eq nil
  end



  let(:resource) { resource = Elmas::ReceivablesListByAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", amount: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccount(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccount?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccount?$filter=Amount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccount?$orderby=Amount&$filter=Amount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount, :id], order_by: :amount)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccount?$orderby=Amount")
      resource.find_all(order_by: :amount)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccount?$select=Amount")
      resource.find_all(select: [:amount])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccount?$select=Amount")
      resource.find_by(select: [:amount])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccount?$select=Amount,ID")
      resource.find_all(select: [:amount, :id])
    end
  end
end
