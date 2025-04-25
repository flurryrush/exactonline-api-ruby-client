require 'spec_helper'

describe Elmas::ByProductReversal do
  it "can initialize" do
    by_product_reversal = Elmas::ByProductReversal.new
    expect(by_product_reversal).to be_a(Elmas::ByProductReversal)
  end

  it "accepts attribute setter" do
    by_product_reversal = Elmas::ByProductReversal.new
    by_product_reversal.shop_order = "78238"
    expect(by_product_reversal.shop_order).to eq "78238"
  end

  it "returns value for getters" do
    by_product_reversal = Elmas::ByProductReversal.new({ "ShopOrder" => "345" })
    expect(by_product_reversal.shop_order).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    by_product_reversal = Elmas::ByProductReversal.new({ this_does_not_exist: "Piet" })
    expect(by_product_reversal.try(:shop_order)).to eq nil
  end

  it "is valid with mandatory attributes" do
    by_product_reversal = Elmas::ByProductReversal.new(original_stock_transaction_id: "OriginalStockTransactionID", transaction_date: "TransactionDate")
    expect(by_product_reversal.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    by_product_reversal = Elmas::ByProductReversal.new
    expect(by_product_reversal.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ByProductReversal.new(id: "12abcdef-1234-1234-1234-123456abcdef", shop_order: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ByProductReversals(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ByProductReversals?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ByProductReversals?$filter=ShopOrder eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:shop_order, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ByProductReversals?$orderby=ShopOrder&$filter=ShopOrder eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:shop_order, :id], order_by: :shop_order)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ByProductReversals?$orderby=ShopOrder")
      resource.find_all(order_by: :shop_order)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ByProductReversals?$select=ShopOrder")
      resource.find_all(select: [:shop_order])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ByProductReversals?$select=ShopOrder")
      resource.find_by(select: [:shop_order])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ByProductReversals?$select=ShopOrder,ID")
      resource.find_all(select: [:shop_order, :id])
    end
  end
end
