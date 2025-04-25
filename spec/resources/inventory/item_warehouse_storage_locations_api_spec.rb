require 'spec_helper'

describe Elmas::ItemWarehouseStorageLocation do
  it "can initialize" do
    item_warehouse_storage_location = Elmas::ItemWarehouseStorageLocation.new
    expect(item_warehouse_storage_location).to be_a(Elmas::ItemWarehouseStorageLocation)
  end

  it "accepts attribute setter" do
    item_warehouse_storage_location = Elmas::ItemWarehouseStorageLocation.new
    item_warehouse_storage_location.item = "78238"
    expect(item_warehouse_storage_location.item).to eq "78238"
  end

  it "returns value for getters" do
    item_warehouse_storage_location = Elmas::ItemWarehouseStorageLocation.new({ "Item" => "345" })
    expect(item_warehouse_storage_location.item).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    item_warehouse_storage_location = Elmas::ItemWarehouseStorageLocation.new({ this_does_not_exist: "Piet" })
    expect(item_warehouse_storage_location.try(:item)).to eq nil
  end



  let(:resource) { resource = Elmas::ItemWarehouseStorageLocation.new(id: "12abcdef-1234-1234-1234-123456abcdef", item: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehouseStorageLocations(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehouseStorageLocations?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehouseStorageLocations?$filter=Item eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehouseStorageLocations?$orderby=Item&$filter=Item eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item, :id], order_by: :item)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehouseStorageLocations?$orderby=Item")
      resource.find_all(order_by: :item)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehouseStorageLocations?$select=Item")
      resource.find_all(select: [:item])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehouseStorageLocations?$select=Item")
      resource.find_by(select: [:item])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehouseStorageLocations?$select=Item,ID")
      resource.find_all(select: [:item, :id])
    end
  end
end
