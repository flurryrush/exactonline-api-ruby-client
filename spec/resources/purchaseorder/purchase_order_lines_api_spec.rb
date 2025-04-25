require 'spec_helper'

describe Elmas::PurchaseOrderLine do
  it "can initialize" do
    purchase_order_line = Elmas::PurchaseOrderLine.new
    expect(purchase_order_line).to be_a(Elmas::PurchaseOrderLine)
  end

  it "accepts attribute setter" do
    purchase_order_line = Elmas::PurchaseOrderLine.new
    purchase_order_line.is_serial_number_item = "78238"
    expect(purchase_order_line.is_serial_number_item).to eq "78238"
  end

  it "returns value for getters" do
    purchase_order_line = Elmas::PurchaseOrderLine.new({ "IsSerialNumberItem" => "345" })
    expect(purchase_order_line.is_serial_number_item).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    purchase_order_line = Elmas::PurchaseOrderLine.new({ this_does_not_exist: "Piet" })
    expect(purchase_order_line.try(:is_serial_number_item)).to eq nil
  end

  it "is valid with mandatory attributes" do
    purchase_order_line = Elmas::PurchaseOrderLine.new(item: "Item", purchase_order_id: "PurchaseOrderID", quantity_in_purchase_units: "QuantityInPurchaseUnits")
    expect(purchase_order_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    purchase_order_line = Elmas::PurchaseOrderLine.new
    expect(purchase_order_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::PurchaseOrderLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", is_serial_number_item: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrderLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrderLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrderLines?$filter=IsSerialNumberItem eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_serial_number_item, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrderLines?$orderby=IsSerialNumberItem&$filter=IsSerialNumberItem eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_serial_number_item, :id], order_by: :is_serial_number_item)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrderLines?$orderby=IsSerialNumberItem")
      resource.find_all(order_by: :is_serial_number_item)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrderLines?$select=IsSerialNumberItem")
      resource.find_all(select: [:is_serial_number_item])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrderLines?$select=IsSerialNumberItem")
      resource.find_by(select: [:is_serial_number_item])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseOrderLines?$select=IsSerialNumberItem,ID")
      resource.find_all(select: [:is_serial_number_item, :id])
    end
  end
end
