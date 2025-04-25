require 'spec_helper'

describe Elmas::BulkSalesOrderSalesOrderLine do
  it "can initialize" do
    bulk_sales_order_sales_order_line = Elmas::BulkSalesOrderSalesOrderLine.new
    expect(bulk_sales_order_sales_order_line).to be_a(Elmas::BulkSalesOrderSalesOrderLine)
  end

  it "accepts attribute setter" do
    bulk_sales_order_sales_order_line = Elmas::BulkSalesOrderSalesOrderLine.new
    bulk_sales_order_sales_order_line.cost_price_fc = "78238"
    expect(bulk_sales_order_sales_order_line.cost_price_fc).to eq "78238"
  end

  it "returns value for getters" do
    bulk_sales_order_sales_order_line = Elmas::BulkSalesOrderSalesOrderLine.new({ "CostPriceFC" => "345" })
    expect(bulk_sales_order_sales_order_line.cost_price_fc).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_sales_order_sales_order_line = Elmas::BulkSalesOrderSalesOrderLine.new({ this_does_not_exist: "Piet" })
    expect(bulk_sales_order_sales_order_line.try(:cost_price_fc)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_sales_order_sales_order_line = Elmas::BulkSalesOrderSalesOrderLine.new(item: "Item", order_id: "OrderID")
    expect(bulk_sales_order_sales_order_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_sales_order_sales_order_line = Elmas::BulkSalesOrderSalesOrderLine.new
    expect(bulk_sales_order_sales_order_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkSalesOrderSalesOrderLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", cost_price_fc: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/SalesOrderLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/SalesOrderLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/SalesOrderLines?$filter=CostPriceFC eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_price_fc, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/SalesOrderLines?$orderby=CostPriceFC&$filter=CostPriceFC eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_price_fc, :id], order_by: :cost_price_fc)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/SalesOrderLines?$orderby=CostPriceFC")
      resource.find_all(order_by: :cost_price_fc)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/SalesOrderLines?$select=CostPriceFC")
      resource.find_all(select: [:cost_price_fc])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/SalesOrderLines?$select=CostPriceFC")
      resource.find_by(select: [:cost_price_fc])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/SalesOrderLines?$select=CostPriceFC,ID")
      resource.find_all(select: [:cost_price_fc, :id])
    end
  end
end
