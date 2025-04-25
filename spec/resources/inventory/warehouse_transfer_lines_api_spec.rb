require 'spec_helper'

describe Elmas::WarehouseTransferLine do
  it "can initialize" do
    warehouse_transfer_line = Elmas::WarehouseTransferLine.new
    expect(warehouse_transfer_line).to be_a(Elmas::WarehouseTransferLine)
  end

  it "accepts attribute setter" do
    warehouse_transfer_line = Elmas::WarehouseTransferLine.new
    warehouse_transfer_line.storage_location_from_code = "78238"
    expect(warehouse_transfer_line.storage_location_from_code).to eq "78238"
  end

  it "returns value for getters" do
    warehouse_transfer_line = Elmas::WarehouseTransferLine.new({ "StorageLocationFromCode" => "345" })
    expect(warehouse_transfer_line.storage_location_from_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    warehouse_transfer_line = Elmas::WarehouseTransferLine.new({ this_does_not_exist: "Piet" })
    expect(warehouse_transfer_line.try(:storage_location_from_code)).to eq nil
  end

  it "is valid with mandatory attributes" do
    warehouse_transfer_line = Elmas::WarehouseTransferLine.new(item: "Item", quantity: "Quantity", transfer_id: "TransferID")
    expect(warehouse_transfer_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    warehouse_transfer_line = Elmas::WarehouseTransferLine.new
    expect(warehouse_transfer_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::WarehouseTransferLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", storage_location_from_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/WarehouseTransferLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/WarehouseTransferLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/WarehouseTransferLines?$filter=StorageLocationFromCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:storage_location_from_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/WarehouseTransferLines?$orderby=StorageLocationFromCode&$filter=StorageLocationFromCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:storage_location_from_code, :id], order_by: :storage_location_from_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/WarehouseTransferLines?$orderby=StorageLocationFromCode")
      resource.find_all(order_by: :storage_location_from_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/WarehouseTransferLines?$select=StorageLocationFromCode")
      resource.find_all(select: [:storage_location_from_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/WarehouseTransferLines?$select=StorageLocationFromCode")
      resource.find_by(select: [:storage_location_from_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/WarehouseTransferLines?$select=StorageLocationFromCode,ID")
      resource.find_all(select: [:storage_location_from_code, :id])
    end
  end
end
