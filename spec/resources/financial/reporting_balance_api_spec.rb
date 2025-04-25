require 'spec_helper'

describe Elmas::ReportingBalance do
  it "can initialize" do
    reporting_balance = Elmas::ReportingBalance.new
    expect(reporting_balance).to be_a(Elmas::ReportingBalance)
  end

  it "accepts attribute setter" do
    reporting_balance = Elmas::ReportingBalance.new
    reporting_balance.amount = "78238"
    expect(reporting_balance.amount).to eq "78238"
  end

  it "returns value for getters" do
    reporting_balance = Elmas::ReportingBalance.new({ "Amount" => "345" })
    expect(reporting_balance.amount).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    reporting_balance = Elmas::ReportingBalance.new({ this_does_not_exist: "Piet" })
    expect(reporting_balance.try(:amount)).to eq nil
  end



  let(:resource) { resource = Elmas::ReportingBalance.new(id: "12abcdef-1234-1234-1234-123456abcdef", amount: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("financial/ReportingBalance(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("financial/ReportingBalance?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("financial/ReportingBalance?$filter=Amount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("financial/ReportingBalance?$orderby=Amount&$filter=Amount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount, :id], order_by: :amount)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("financial/ReportingBalance?$orderby=Amount")
      resource.find_all(order_by: :amount)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/ReportingBalance?$select=Amount")
      resource.find_all(select: [:amount])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("financial/ReportingBalance?$select=Amount")
      resource.find_by(select: [:amount])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/ReportingBalance?$select=Amount,ID")
      resource.find_all(select: [:amount, :id])
    end
  end
end
