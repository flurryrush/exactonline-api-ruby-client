require 'spec_helper'

describe Elmas::ItemWarehouse do
  it "can initialize" do
    item_warehouse = Elmas::ItemWarehouse.new
    expect(item_warehouse).to be_a(Elmas::ItemWarehouse)
  end

  it "accepts attribute setter" do
    item_warehouse = Elmas::ItemWarehouse.new
    item_warehouse.modifier_full_name = "78238"
    expect(item_warehouse.modifier_full_name).to eq "78238"
  end

  it "returns value for getters" do
    item_warehouse = Elmas::ItemWarehouse.new({ "ModifierFullName" => "345" })
    expect(item_warehouse.modifier_full_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    item_warehouse = Elmas::ItemWarehouse.new({ this_does_not_exist: "Piet" })
    expect(item_warehouse.try(:modifier_full_name)).to eq nil
  end

  it "is valid with mandatory attributes" do
    item_warehouse = Elmas::ItemWarehouse.new(item: "Item", warehouse: "Warehouse")
    expect(item_warehouse.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    item_warehouse = Elmas::ItemWarehouse.new
    expect(item_warehouse.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ItemWarehouse.new(id: "12abcdef-1234-1234-1234-123456abcdef", modifier_full_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehouses(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehouses?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehouses?$filter=ModifierFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier_full_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehouses?$orderby=ModifierFullName&$filter=ModifierFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier_full_name, :id], order_by: :modifier_full_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehouses?$orderby=ModifierFullName")
      resource.find_all(order_by: :modifier_full_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehouses?$select=ModifierFullName")
      resource.find_all(select: [:modifier_full_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehouses?$select=ModifierFullName")
      resource.find_by(select: [:modifier_full_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehouses?$select=ModifierFullName,ID")
      resource.find_all(select: [:modifier_full_name, :id])
    end
  end
end
