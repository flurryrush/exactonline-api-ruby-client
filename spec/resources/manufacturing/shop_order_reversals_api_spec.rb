require 'spec_helper'

describe Elmas::ShopOrderReversal do
  it "can initialize" do
    shop_order_reversal = Elmas::ShopOrderReversal.new
    expect(shop_order_reversal).to be_a(Elmas::ShopOrderReversal)
  end

  it "accepts attribute setter" do
    shop_order_reversal = Elmas::ShopOrderReversal.new
    shop_order_reversal.storage_location_description = "78238"
    expect(shop_order_reversal.storage_location_description).to eq "78238"
  end

  it "returns value for getters" do
    shop_order_reversal = Elmas::ShopOrderReversal.new({ "StorageLocationDescription" => "345" })
    expect(shop_order_reversal.storage_location_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    shop_order_reversal = Elmas::ShopOrderReversal.new({ this_does_not_exist: "Piet" })
    expect(shop_order_reversal.try(:storage_location_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    shop_order_reversal = Elmas::ShopOrderReversal.new(original_stock_transaction_id: "OriginalStockTransactionID", transaction_date: "TransactionDate")
    expect(shop_order_reversal.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    shop_order_reversal = Elmas::ShopOrderReversal.new
    expect(shop_order_reversal.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ShopOrderReversal.new(id: "12abcdef-1234-1234-1234-123456abcdef", storage_location_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReversals(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReversals?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReversals?$filter=StorageLocationDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:storage_location_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReversals?$orderby=StorageLocationDescription&$filter=StorageLocationDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:storage_location_description, :id], order_by: :storage_location_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReversals?$orderby=StorageLocationDescription")
      resource.find_all(order_by: :storage_location_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReversals?$select=StorageLocationDescription")
      resource.find_all(select: [:storage_location_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReversals?$select=StorageLocationDescription")
      resource.find_by(select: [:storage_location_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReversals?$select=StorageLocationDescription,ID")
      resource.find_all(select: [:storage_location_description, :id])
    end
  end
end
