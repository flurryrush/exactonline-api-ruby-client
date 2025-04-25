require 'spec_helper'

describe Elmas::SyncManufacturingShopOrderPurchasePlanning do
  it "can initialize" do
    sync_manufacturing_shop_order_purchase_planning = Elmas::SyncManufacturingShopOrderPurchasePlanning.new
    expect(sync_manufacturing_shop_order_purchase_planning).to be_a(Elmas::SyncManufacturingShopOrderPurchasePlanning)
  end

  it "accepts attribute setter" do
    sync_manufacturing_shop_order_purchase_planning = Elmas::SyncManufacturingShopOrderPurchasePlanning.new
    sync_manufacturing_shop_order_purchase_planning.shop_order_number = "78238"
    expect(sync_manufacturing_shop_order_purchase_planning.shop_order_number).to eq "78238"
  end

  it "returns value for getters" do
    sync_manufacturing_shop_order_purchase_planning = Elmas::SyncManufacturingShopOrderPurchasePlanning.new({ "ShopOrderNumber" => "345" })
    expect(sync_manufacturing_shop_order_purchase_planning.shop_order_number).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_manufacturing_shop_order_purchase_planning = Elmas::SyncManufacturingShopOrderPurchasePlanning.new({ this_does_not_exist: "Piet" })
    expect(sync_manufacturing_shop_order_purchase_planning.try(:shop_order_number)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncManufacturingShopOrderPurchasePlanning.new(id: "12abcdef-1234-1234-1234-123456abcdef", shop_order_number: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderPurchasePlanning(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderPurchasePlanning?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderPurchasePlanning?$filter=ShopOrderNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:shop_order_number, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderPurchasePlanning?$orderby=ShopOrderNumber&$filter=ShopOrderNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:shop_order_number, :id], order_by: :shop_order_number)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderPurchasePlanning?$orderby=ShopOrderNumber")
      resource.find_all(order_by: :shop_order_number)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderPurchasePlanning?$select=ShopOrderNumber")
      resource.find_all(select: [:shop_order_number])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderPurchasePlanning?$select=ShopOrderNumber")
      resource.find_by(select: [:shop_order_number])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderPurchasePlanning?$select=ShopOrderNumber,ID")
      resource.find_all(select: [:shop_order_number, :id])
    end
  end
end
