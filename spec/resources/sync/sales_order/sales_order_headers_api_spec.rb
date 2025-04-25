require 'spec_helper'

describe Elmas::SyncSalesOrderSalesOrderHeader do
  it "can initialize" do
    sync_sales_order_sales_order_header = Elmas::SyncSalesOrderSalesOrderHeader.new
    expect(sync_sales_order_sales_order_header).to be_a(Elmas::SyncSalesOrderSalesOrderHeader)
  end

  it "accepts attribute setter" do
    sync_sales_order_sales_order_header = Elmas::SyncSalesOrderSalesOrderHeader.new
    sync_sales_order_sales_order_header.project = "78238"
    expect(sync_sales_order_sales_order_header.project).to eq "78238"
  end

  it "returns value for getters" do
    sync_sales_order_sales_order_header = Elmas::SyncSalesOrderSalesOrderHeader.new({ "Project" => "345" })
    expect(sync_sales_order_sales_order_header.project).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_sales_order_sales_order_header = Elmas::SyncSalesOrderSalesOrderHeader.new({ this_does_not_exist: "Piet" })
    expect(sync_sales_order_sales_order_header.try(:project)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncSalesOrderSalesOrderHeader.new(id: "12abcdef-1234-1234-1234-123456abcdef", project: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderHeaders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderHeaders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderHeaders?$filter=Project eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderHeaders?$orderby=Project&$filter=Project eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project, :id], order_by: :project)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderHeaders?$orderby=Project")
      resource.find_all(order_by: :project)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderHeaders?$select=Project")
      resource.find_all(select: [:project])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderHeaders?$select=Project")
      resource.find_by(select: [:project])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/SalesOrderHeaders?$select=Project,ID")
      resource.find_all(select: [:project, :id])
    end
  end
end
