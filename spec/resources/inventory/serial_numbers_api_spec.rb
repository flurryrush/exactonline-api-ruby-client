require 'spec_helper'

describe Elmas::SerialNumber do
  it "can initialize" do
    serial_number = Elmas::SerialNumber.new
    expect(serial_number).to be_a(Elmas::SerialNumber)
  end

  it "accepts attribute setter" do
    serial_number = Elmas::SerialNumber.new
    serial_number.warehouse_code = "78238"
    expect(serial_number.warehouse_code).to eq "78238"
  end

  it "returns value for getters" do
    serial_number = Elmas::SerialNumber.new({ "WarehouseCode" => "345" })
    expect(serial_number.warehouse_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    serial_number = Elmas::SerialNumber.new({ this_does_not_exist: "Piet" })
    expect(serial_number.try(:warehouse_code)).to eq nil
  end



  let(:resource) { resource = Elmas::SerialNumber.new(id: "12abcdef-1234-1234-1234-123456abcdef", warehouse_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/SerialNumbers(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/SerialNumbers?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/SerialNumbers?$filter=WarehouseCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/SerialNumbers?$orderby=WarehouseCode&$filter=WarehouseCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse_code, :id], order_by: :warehouse_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/SerialNumbers?$orderby=WarehouseCode")
      resource.find_all(order_by: :warehouse_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/SerialNumbers?$select=WarehouseCode")
      resource.find_all(select: [:warehouse_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/SerialNumbers?$select=WarehouseCode")
      resource.find_by(select: [:warehouse_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/SerialNumbers?$select=WarehouseCode,ID")
      resource.find_all(select: [:warehouse_code, :id])
    end
  end
end
