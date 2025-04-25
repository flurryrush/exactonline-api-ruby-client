require 'spec_helper'

describe Elmas::DropShipmentLine do
  it "can initialize" do
    drop_shipment_line = Elmas::DropShipmentLine.new
    expect(drop_shipment_line).to be_a(Elmas::DropShipmentLine)
  end

  it "accepts attribute setter" do
    drop_shipment_line = Elmas::DropShipmentLine.new
    drop_shipment_line.delivery_date = "78238"
    expect(drop_shipment_line.delivery_date).to eq "78238"
  end

  it "returns value for getters" do
    drop_shipment_line = Elmas::DropShipmentLine.new({ "DeliveryDate" => "345" })
    expect(drop_shipment_line.delivery_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    drop_shipment_line = Elmas::DropShipmentLine.new({ this_does_not_exist: "Piet" })
    expect(drop_shipment_line.try(:delivery_date)).to eq nil
  end

  it "is valid with mandatory attributes" do
    drop_shipment_line = Elmas::DropShipmentLine.new(purchase_order_line_id: "PurchaseOrderLineID", quantity_delivered: "QuantityDelivered", sales_order_line_id: "SalesOrderLineID")
    expect(drop_shipment_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    drop_shipment_line = Elmas::DropShipmentLine.new
    expect(drop_shipment_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::DropShipmentLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", delivery_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesorder/DropShipmentLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesorder/DropShipmentLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesorder/DropShipmentLines?$filter=DeliveryDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:delivery_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("salesorder/DropShipmentLines?$orderby=DeliveryDate&$filter=DeliveryDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:delivery_date, :id], order_by: :delivery_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("salesorder/DropShipmentLines?$orderby=DeliveryDate")
      resource.find_all(order_by: :delivery_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/DropShipmentLines?$select=DeliveryDate")
      resource.find_all(select: [:delivery_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("salesorder/DropShipmentLines?$select=DeliveryDate")
      resource.find_by(select: [:delivery_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/DropShipmentLines?$select=DeliveryDate,ID")
      resource.find_all(select: [:delivery_date, :id])
    end
  end
end
