require 'spec_helper'

describe Elmas::BulkSalesOrderGoodsDelivery do
  it "can initialize" do
    bulk_sales_order_goods_delivery = Elmas::BulkSalesOrderGoodsDelivery.new
    expect(bulk_sales_order_goods_delivery).to be_a(Elmas::BulkSalesOrderGoodsDelivery)
  end

  it "accepts attribute setter" do
    bulk_sales_order_goods_delivery = Elmas::BulkSalesOrderGoodsDelivery.new
    bulk_sales_order_goods_delivery.remarks = "78238"
    expect(bulk_sales_order_goods_delivery.remarks).to eq "78238"
  end

  it "returns value for getters" do
    bulk_sales_order_goods_delivery = Elmas::BulkSalesOrderGoodsDelivery.new({ "Remarks" => "345" })
    expect(bulk_sales_order_goods_delivery.remarks).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_sales_order_goods_delivery = Elmas::BulkSalesOrderGoodsDelivery.new({ this_does_not_exist: "Piet" })
    expect(bulk_sales_order_goods_delivery.try(:remarks)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_sales_order_goods_delivery = Elmas::BulkSalesOrderGoodsDelivery.new(delivery_date: "DeliveryDate", goods_delivery_lines: "GoodsDeliveryLines")
    expect(bulk_sales_order_goods_delivery.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_sales_order_goods_delivery = Elmas::BulkSalesOrderGoodsDelivery.new
    expect(bulk_sales_order_goods_delivery.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkSalesOrderGoodsDelivery.new(id: "12abcdef-1234-1234-1234-123456abcdef", remarks: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveries(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveries?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveries?$filter=Remarks eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:remarks, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveries?$orderby=Remarks&$filter=Remarks eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:remarks, :id], order_by: :remarks)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveries?$orderby=Remarks")
      resource.find_all(order_by: :remarks)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveries?$select=Remarks")
      resource.find_all(select: [:remarks])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveries?$select=Remarks")
      resource.find_by(select: [:remarks])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/SalesOrder/GoodsDeliveries?$select=Remarks,ID")
      resource.find_all(select: [:remarks, :id])
    end
  end
end
