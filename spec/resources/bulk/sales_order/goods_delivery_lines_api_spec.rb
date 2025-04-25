require 'spec_helper'

describe Elmas::BulkSalesOrderGoodsDeliveryLine do
  it "can initialize" do
    bulk_sales_order_goods_delivery_line = Elmas::BulkSalesOrderGoodsDeliveryLine.new
    expect(bulk_sales_order_goods_delivery_line).to be_a(Elmas::BulkSalesOrderGoodsDeliveryLine)
  end

  it "accepts attribute setter" do
    bulk_sales_order_goods_delivery_line = Elmas::BulkSalesOrderGoodsDeliveryLine.new
    bulk_sales_order_goods_delivery_line.entry_id = "78238"
    expect(bulk_sales_order_goods_delivery_line.entry_id).to eq "78238"
  end

  it "returns value for getters" do
    bulk_sales_order_goods_delivery_line = Elmas::BulkSalesOrderGoodsDeliveryLine.new({ "EntryID" => "345" })
    expect(bulk_sales_order_goods_delivery_line.entry_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_sales_order_goods_delivery_line = Elmas::BulkSalesOrderGoodsDeliveryLine.new({ this_does_not_exist: "Piet" })
    expect(bulk_sales_order_goods_delivery_line.try(:entry_id)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_sales_order_goods_delivery_line = Elmas::BulkSalesOrderGoodsDeliveryLine.new(quantity_delivered: "QuantityDelivered", sales_order_line_id: "SalesOrderLineID")
    expect(bulk_sales_order_goods_delivery_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_sales_order_goods_delivery_line = Elmas::BulkSalesOrderGoodsDeliveryLine.new
    expect(bulk_sales_order_goods_delivery_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkSalesOrderGoodsDeliveryLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", entry_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveryLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveryLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveryLines?$filter=EntryID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:entry_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveryLines?$orderby=EntryID&$filter=EntryID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:entry_id, :id], order_by: :entry_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveryLines?$orderby=EntryID")
      resource.find_all(order_by: :entry_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveryLines?$select=EntryID")
      resource.find_all(select: [:entry_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveryLines?$select=EntryID")
      resource.find_by(select: [:entry_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveryLines?$select=EntryID,ID")
      resource.find_all(select: [:entry_id, :id])
    end
  end
end
