require 'spec_helper'

describe Elmas::SyncSalesOrderSalesOrderLine do
  it "can initialize" do
    sync_sales_order_sales_order_line = Elmas::SyncSalesOrderSalesOrderLine.new
    expect(sync_sales_order_sales_order_line).to be_a(Elmas::SyncSalesOrderSalesOrderLine)
  end

  it "accepts attribute setter" do
    sync_sales_order_sales_order_line = Elmas::SyncSalesOrderSalesOrderLine.new
    sync_sales_order_sales_order_line.creator = "78238"
    expect(sync_sales_order_sales_order_line.creator).to eq "78238"
  end

  it "returns value for getters" do
    sync_sales_order_sales_order_line = Elmas::SyncSalesOrderSalesOrderLine.new({ "Creator" => "345" })
    expect(sync_sales_order_sales_order_line.creator).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_sales_order_sales_order_line = Elmas::SyncSalesOrderSalesOrderLine.new({ this_does_not_exist: "Piet" })
    expect(sync_sales_order_sales_order_line.try(:creator)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncSalesOrderSalesOrderLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderLines?$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderLines?$orderby=Creator&$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id], order_by: :creator)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderLines?$orderby=Creator")
      resource.find_all(order_by: :creator)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderLines?$select=Creator")
      resource.find_all(select: [:creator])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderLines?$select=Creator")
      resource.find_by(select: [:creator])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderLines?$select=Creator,ID")
      resource.find_all(select: [:creator, :id])
    end
  end
end
