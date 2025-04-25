require 'spec_helper'

describe Elmas::SyncInventoryItemStorageLocation do
  it "can initialize" do
    sync_inventory_item_storage_location = Elmas::SyncInventoryItemStorageLocation.new
    expect(sync_inventory_item_storage_location).to be_a(Elmas::SyncInventoryItemStorageLocation)
  end

  it "accepts attribute setter" do
    sync_inventory_item_storage_location = Elmas::SyncInventoryItemStorageLocation.new
    sync_inventory_item_storage_location.warehouse_description = "78238"
    expect(sync_inventory_item_storage_location.warehouse_description).to eq "78238"
  end

  it "returns value for getters" do
    sync_inventory_item_storage_location = Elmas::SyncInventoryItemStorageLocation.new({ "WarehouseDescription" => "345" })
    expect(sync_inventory_item_storage_location.warehouse_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_inventory_item_storage_location = Elmas::SyncInventoryItemStorageLocation.new({ this_does_not_exist: "Piet" })
    expect(sync_inventory_item_storage_location.try(:warehouse_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_inventory_item_storage_location = Elmas::SyncInventoryItemStorageLocation.new(item: "Item", warehouse: "Warehouse")
    expect(sync_inventory_item_storage_location.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_inventory_item_storage_location = Elmas::SyncInventoryItemStorageLocation.new
    expect(sync_inventory_item_storage_location.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncInventoryItemStorageLocation.new(id: "12abcdef-1234-1234-1234-123456abcdef", warehouse_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Inventory/ItemStorageLocations(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Inventory/ItemStorageLocations?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Inventory/ItemStorageLocations?$filter=WarehouseDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Inventory/ItemStorageLocations?$orderby=WarehouseDescription&$filter=WarehouseDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse_description, :id], order_by: :warehouse_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Inventory/ItemStorageLocations?$orderby=WarehouseDescription")
      resource.find_all(order_by: :warehouse_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Inventory/ItemStorageLocations?$select=WarehouseDescription")
      resource.find_all(select: [:warehouse_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Inventory/ItemStorageLocations?$select=WarehouseDescription")
      resource.find_by(select: [:warehouse_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Inventory/ItemStorageLocations?$select=WarehouseDescription,ID")
      resource.find_all(select: [:warehouse_description, :id])
    end
  end
end
