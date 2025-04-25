require 'spec_helper'

describe Elmas::Warehouse do
  it "can initialize" do
    warehouse = Elmas::Warehouse.new
    expect(warehouse).to be_a(Elmas::Warehouse)
  end

  it "accepts attribute setter" do
    warehouse = Elmas::Warehouse.new
    warehouse.default_storage_location_code = "78238"
    expect(warehouse.default_storage_location_code).to eq "78238"
  end

  it "returns value for getters" do
    warehouse = Elmas::Warehouse.new({ "DefaultStorageLocationCode" => "345" })
    expect(warehouse.default_storage_location_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    warehouse = Elmas::Warehouse.new({ this_does_not_exist: "Piet" })
    expect(warehouse.try(:default_storage_location_code)).to eq nil
  end



  let(:resource) { resource = Elmas::Warehouse.new(id: "12abcdef-1234-1234-1234-123456abcdef", default_storage_location_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/Warehouses(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/Warehouses?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/Warehouses?$filter=DefaultStorageLocationCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:default_storage_location_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/Warehouses?$orderby=DefaultStorageLocationCode&$filter=DefaultStorageLocationCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:default_storage_location_code, :id], order_by: :default_storage_location_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/Warehouses?$orderby=DefaultStorageLocationCode")
      resource.find_all(order_by: :default_storage_location_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/Warehouses?$select=DefaultStorageLocationCode")
      resource.find_all(select: [:default_storage_location_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/Warehouses?$select=DefaultStorageLocationCode")
      resource.find_by(select: [:default_storage_location_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/Warehouses?$select=DefaultStorageLocationCode,ID")
      resource.find_all(select: [:default_storage_location_code, :id])
    end
  end
end
