require 'spec_helper'

describe Elmas::SyncManufacturingShopOrder do
  it "can initialize" do
    sync_manufacturing_shop_order = Elmas::SyncManufacturingShopOrder.new
    expect(sync_manufacturing_shop_order).to be_a(Elmas::SyncManufacturingShopOrder)
  end

  it "accepts attribute setter" do
    sync_manufacturing_shop_order = Elmas::SyncManufacturingShopOrder.new
    sync_manufacturing_shop_order.notes = "78238"
    expect(sync_manufacturing_shop_order.notes).to eq "78238"
  end

  it "returns value for getters" do
    sync_manufacturing_shop_order = Elmas::SyncManufacturingShopOrder.new({ "Notes" => "345" })
    expect(sync_manufacturing_shop_order.notes).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_manufacturing_shop_order = Elmas::SyncManufacturingShopOrder.new({ this_does_not_exist: "Piet" })
    expect(sync_manufacturing_shop_order.try(:notes)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_manufacturing_shop_order = Elmas::SyncManufacturingShopOrder.new(item: "Item", planned_quantity: "PlannedQuantity")
    expect(sync_manufacturing_shop_order.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_manufacturing_shop_order = Elmas::SyncManufacturingShopOrder.new
    expect(sync_manufacturing_shop_order.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncManufacturingShopOrder.new(id: "12abcdef-1234-1234-1234-123456abcdef", notes: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrders?$filter=Notes eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:notes, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrders?$orderby=Notes&$filter=Notes eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:notes, :id], order_by: :notes)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrders?$orderby=Notes")
      resource.find_all(order_by: :notes)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrders?$select=Notes")
      resource.find_all(select: [:notes])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrders?$select=Notes")
      resource.find_by(select: [:notes])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrders?$select=Notes,ID")
      resource.find_all(select: [:notes, :id])
    end
  end
end
