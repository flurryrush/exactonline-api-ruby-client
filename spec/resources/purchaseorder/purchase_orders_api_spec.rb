require 'spec_helper'

describe Elmas::PurchaseOrder do
  it "can initialize" do
    purchase_order = Elmas::PurchaseOrder.new
    expect(purchase_order).to be_a(Elmas::PurchaseOrder)
  end

  it "accepts attribute setter" do
    purchase_order = Elmas::PurchaseOrder.new
    purchase_order.warehouse = "78238"
    expect(purchase_order.warehouse).to eq "78238"
  end

  it "returns value for getters" do
    purchase_order = Elmas::PurchaseOrder.new({ "Warehouse" => "345" })
    expect(purchase_order.warehouse).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    purchase_order = Elmas::PurchaseOrder.new({ this_does_not_exist: "Piet" })
    expect(purchase_order.try(:warehouse)).to eq nil
  end

  it "is valid with mandatory attributes" do
    purchase_order = Elmas::PurchaseOrder.new(purchase_order_lines: "PurchaseOrderLines", supplier: "Supplier")
    expect(purchase_order.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    purchase_order = Elmas::PurchaseOrder.new
    expect(purchase_order.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::PurchaseOrder.new(id: "12abcdef-1234-1234-1234-123456abcdef", warehouse: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrders?$filter=Warehouse eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrders?$orderby=Warehouse&$filter=Warehouse eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse, :id], order_by: :warehouse)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrders?$orderby=Warehouse")
      resource.find_all(order_by: :warehouse)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrders?$select=Warehouse")
      resource.find_all(select: [:warehouse])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrders?$select=Warehouse")
      resource.find_by(select: [:warehouse])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrders?$select=Warehouse,ID")
      resource.find_all(select: [:warehouse, :id])
    end
  end
end
