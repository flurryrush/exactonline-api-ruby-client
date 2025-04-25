require 'spec_helper'

describe Elmas::SyncInventoryStorageLocationStockPosition do
  it "can initialize" do
    sync_inventory_storage_location_stock_position = Elmas::SyncInventoryStorageLocationStockPosition.new
    expect(sync_inventory_storage_location_stock_position).to be_a(Elmas::SyncInventoryStorageLocationStockPosition)
  end

  it "accepts attribute setter" do
    sync_inventory_storage_location_stock_position = Elmas::SyncInventoryStorageLocationStockPosition.new
    sync_inventory_storage_location_stock_position.storage_location_description = "78238"
    expect(sync_inventory_storage_location_stock_position.storage_location_description).to eq "78238"
  end

  it "returns value for getters" do
    sync_inventory_storage_location_stock_position = Elmas::SyncInventoryStorageLocationStockPosition.new({ "StorageLocationDescription" => "345" })
    expect(sync_inventory_storage_location_stock_position.storage_location_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_inventory_storage_location_stock_position = Elmas::SyncInventoryStorageLocationStockPosition.new({ this_does_not_exist: "Piet" })
    expect(sync_inventory_storage_location_stock_position.try(:storage_location_description)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncInventoryStorageLocationStockPosition.new(id: "12abcdef-1234-1234-1234-123456abcdef", storage_location_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Inventory/StorageLocationStockPositions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Inventory/StorageLocationStockPositions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Inventory/StorageLocationStockPositions?$filter=StorageLocationDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:storage_location_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Inventory/StorageLocationStockPositions?$orderby=StorageLocationDescription&$filter=StorageLocationDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:storage_location_description, :id], order_by: :storage_location_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Inventory/StorageLocationStockPositions?$orderby=StorageLocationDescription")
      resource.find_all(order_by: :storage_location_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Inventory/StorageLocationStockPositions?$select=StorageLocationDescription")
      resource.find_all(select: [:storage_location_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Inventory/StorageLocationStockPositions?$select=StorageLocationDescription")
      resource.find_by(select: [:storage_location_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Inventory/StorageLocationStockPositions?$select=StorageLocationDescription,ID")
      resource.find_all(select: [:storage_location_description, :id])
    end
  end
end
