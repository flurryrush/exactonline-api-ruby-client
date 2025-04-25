require 'spec_helper'

describe Elmas::SyncInventoryItemWarehouse do
  it "can initialize" do
    sync_inventory_item_warehouse = Elmas::SyncInventoryItemWarehouse.new
    expect(sync_inventory_item_warehouse).to be_a(Elmas::SyncInventoryItemWarehouse)
  end

  it "accepts attribute setter" do
    sync_inventory_item_warehouse = Elmas::SyncInventoryItemWarehouse.new
    sync_inventory_item_warehouse.creator_full_name = "78238"
    expect(sync_inventory_item_warehouse.creator_full_name).to eq "78238"
  end

  it "returns value for getters" do
    sync_inventory_item_warehouse = Elmas::SyncInventoryItemWarehouse.new({ "CreatorFullName" => "345" })
    expect(sync_inventory_item_warehouse.creator_full_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_inventory_item_warehouse = Elmas::SyncInventoryItemWarehouse.new({ this_does_not_exist: "Piet" })
    expect(sync_inventory_item_warehouse.try(:creator_full_name)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_inventory_item_warehouse = Elmas::SyncInventoryItemWarehouse.new(item: "Item", warehouse: "Warehouse")
    expect(sync_inventory_item_warehouse.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_inventory_item_warehouse = Elmas::SyncInventoryItemWarehouse.new
    expect(sync_inventory_item_warehouse.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncInventoryItemWarehouse.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator_full_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Inventory/ItemWarehouses(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Inventory/ItemWarehouses?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Inventory/ItemWarehouses?$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Inventory/ItemWarehouses?$orderby=CreatorFullName&$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id], order_by: :creator_full_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Inventory/ItemWarehouses?$orderby=CreatorFullName")
      resource.find_all(order_by: :creator_full_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Inventory/ItemWarehouses?$select=CreatorFullName")
      resource.find_all(select: [:creator_full_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Inventory/ItemWarehouses?$select=CreatorFullName")
      resource.find_by(select: [:creator_full_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Inventory/ItemWarehouses?$select=CreatorFullName,ID")
      resource.find_all(select: [:creator_full_name, :id])
    end
  end
end
