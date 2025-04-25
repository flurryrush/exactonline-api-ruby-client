require 'spec_helper'

describe Elmas::AgingOverview do
  it "can initialize" do
    aging_overview = Elmas::AgingOverview.new
    expect(aging_overview).to be_a(Elmas::AgingOverview)
  end

  it "accepts attribute setter" do
    aging_overview = Elmas::AgingOverview.new
    aging_overview.amount_payable = "78238"
    expect(aging_overview.amount_payable).to eq "78238"
  end

  it "returns value for getters" do
    aging_overview = Elmas::AgingOverview.new({ "AmountPayable" => "345" })
    expect(aging_overview.amount_payable).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    aging_overview = Elmas::AgingOverview.new({ this_does_not_exist: "Piet" })
    expect(aging_overview.try(:amount_payable)).to eq nil
  end



  let(:resource) { resource = Elmas::AgingOverview.new(id: "12abcdef-1234-1234-1234-123456abcdef", amount_payable: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/AgingOverview(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/AgingOverview?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/AgingOverview?$filter=AmountPayable eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_payable, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/AgingOverview?$orderby=AmountPayable&$filter=AmountPayable eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_payable, :id], order_by: :amount_payable)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/AgingOverview?$orderby=AmountPayable")
      resource.find_all(order_by: :amount_payable)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/AgingOverview?$select=AmountPayable")
      resource.find_all(select: [:amount_payable])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/AgingOverview?$select=AmountPayable")
      resource.find_by(select: [:amount_payable])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/AgingOverview?$select=AmountPayable,ID")
      resource.find_all(select: [:amount_payable, :id])
    end
  end
end
