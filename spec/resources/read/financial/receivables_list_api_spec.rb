require 'spec_helper'

describe Elmas::ReceivablesList do
  it "can initialize" do
    receivables_list = Elmas::ReceivablesList.new
    expect(receivables_list).to be_a(Elmas::ReceivablesList)
  end

  it "accepts attribute setter" do
    receivables_list = Elmas::ReceivablesList.new
    receivables_list.amount_in_transit = "78238"
    expect(receivables_list.amount_in_transit).to eq "78238"
  end

  it "returns value for getters" do
    receivables_list = Elmas::ReceivablesList.new({ "AmountInTransit" => "345" })
    expect(receivables_list.amount_in_transit).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    receivables_list = Elmas::ReceivablesList.new({ this_does_not_exist: "Piet" })
    expect(receivables_list.try(:amount_in_transit)).to eq nil
  end



  let(:resource) { resource = Elmas::ReceivablesList.new(id: "12abcdef-1234-1234-1234-123456abcdef", amount_in_transit: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesList(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesList?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesList?$filter=AmountInTransit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_in_transit, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesList?$orderby=AmountInTransit&$filter=AmountInTransit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_in_transit, :id], order_by: :amount_in_transit)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesList?$orderby=AmountInTransit")
      resource.find_all(order_by: :amount_in_transit)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesList?$select=AmountInTransit")
      resource.find_all(select: [:amount_in_transit])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesList?$select=AmountInTransit")
      resource.find_by(select: [:amount_in_transit])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesList?$select=AmountInTransit,ID")
      resource.find_all(select: [:amount_in_transit, :id])
    end
  end
end
