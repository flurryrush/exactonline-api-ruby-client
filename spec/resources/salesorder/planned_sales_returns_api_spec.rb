require 'spec_helper'

describe Elmas::PlannedSalesReturn do
  it "can initialize" do
    planned_sales_return = Elmas::PlannedSalesReturn.new
    expect(planned_sales_return).to be_a(Elmas::PlannedSalesReturn)
  end

  it "accepts attribute setter" do
    planned_sales_return = Elmas::PlannedSalesReturn.new
    planned_sales_return.modified = "78238"
    expect(planned_sales_return.modified).to eq "78238"
  end

  it "returns value for getters" do
    planned_sales_return = Elmas::PlannedSalesReturn.new({ "Modified" => "345" })
    expect(planned_sales_return.modified).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    planned_sales_return = Elmas::PlannedSalesReturn.new({ this_does_not_exist: "Piet" })
    expect(planned_sales_return.try(:modified)).to eq nil
  end

  it "is valid with mandatory attributes" do
    planned_sales_return = Elmas::PlannedSalesReturn.new(delivered_to: "DeliveredTo", planned_sales_return_lines: "PlannedSalesReturnLines", warehouse: "Warehouse")
    expect(planned_sales_return.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    planned_sales_return = Elmas::PlannedSalesReturn.new
    expect(planned_sales_return.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::PlannedSalesReturn.new(id: "12abcdef-1234-1234-1234-123456abcdef", modified: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturns(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturns?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturns?$filter=Modified eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modified, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturns?$orderby=Modified&$filter=Modified eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modified, :id], order_by: :modified)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturns?$orderby=Modified")
      resource.find_all(order_by: :modified)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturns?$select=Modified")
      resource.find_all(select: [:modified])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturns?$select=Modified")
      resource.find_by(select: [:modified])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturns?$select=Modified,ID")
      resource.find_all(select: [:modified, :id])
    end
  end
end
