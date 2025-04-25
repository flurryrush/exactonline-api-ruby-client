require 'spec_helper'

describe Elmas::PayablesList do
  it "can initialize" do
    payables_list = Elmas::PayablesList.new
    expect(payables_list).to be_a(Elmas::PayablesList)
  end

  it "accepts attribute setter" do
    payables_list = Elmas::PayablesList.new
    payables_list.account_name = "78238"
    expect(payables_list.account_name).to eq "78238"
  end

  it "returns value for getters" do
    payables_list = Elmas::PayablesList.new({ "AccountName" => "345" })
    expect(payables_list.account_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    payables_list = Elmas::PayablesList.new({ this_does_not_exist: "Piet" })
    expect(payables_list.try(:account_name)).to eq nil
  end



  let(:resource) { resource = Elmas::PayablesList.new(id: "12abcdef-1234-1234-1234-123456abcdef", account_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesList(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesList?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesList?$filter=AccountName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesList?$orderby=AccountName&$filter=AccountName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_name, :id], order_by: :account_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesList?$orderby=AccountName")
      resource.find_all(order_by: :account_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesList?$select=AccountName")
      resource.find_all(select: [:account_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesList?$select=AccountName")
      resource.find_by(select: [:account_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesList?$select=AccountName,ID")
      resource.find_all(select: [:account_name, :id])
    end
  end
end
