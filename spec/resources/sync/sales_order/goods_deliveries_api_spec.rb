require 'spec_helper'

describe Elmas::SyncSalesOrderGoodsDelivery do
  it "can initialize" do
    sync_sales_order_goods_delivery = Elmas::SyncSalesOrderGoodsDelivery.new
    expect(sync_sales_order_goods_delivery).to be_a(Elmas::SyncSalesOrderGoodsDelivery)
  end

  it "accepts attribute setter" do
    sync_sales_order_goods_delivery = Elmas::SyncSalesOrderGoodsDelivery.new
    sync_sales_order_goods_delivery.delivery_address = "78238"
    expect(sync_sales_order_goods_delivery.delivery_address).to eq "78238"
  end

  it "returns value for getters" do
    sync_sales_order_goods_delivery = Elmas::SyncSalesOrderGoodsDelivery.new({ "DeliveryAddress" => "345" })
    expect(sync_sales_order_goods_delivery.delivery_address).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_sales_order_goods_delivery = Elmas::SyncSalesOrderGoodsDelivery.new({ this_does_not_exist: "Piet" })
    expect(sync_sales_order_goods_delivery.try(:delivery_address)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_sales_order_goods_delivery = Elmas::SyncSalesOrderGoodsDelivery.new(delivery_date: "DeliveryDate")
    expect(sync_sales_order_goods_delivery.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_sales_order_goods_delivery = Elmas::SyncSalesOrderGoodsDelivery.new
    expect(sync_sales_order_goods_delivery.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncSalesOrderGoodsDelivery.new(id: "12abcdef-1234-1234-1234-123456abcdef", delivery_address: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/GoodsDeliveries(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/GoodsDeliveries?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/GoodsDeliveries?$filter=DeliveryAddress eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:delivery_address, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/GoodsDeliveries?$orderby=DeliveryAddress&$filter=DeliveryAddress eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:delivery_address, :id], order_by: :delivery_address)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/SalesOrder/GoodsDeliveries?$orderby=DeliveryAddress")
      resource.find_all(order_by: :delivery_address)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/GoodsDeliveries?$select=DeliveryAddress")
      resource.find_all(select: [:delivery_address])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/GoodsDeliveries?$select=DeliveryAddress")
      resource.find_by(select: [:delivery_address])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/SalesOrder/GoodsDeliveries?$select=DeliveryAddress,ID")
      resource.find_all(select: [:delivery_address, :id])
    end
  end
end
