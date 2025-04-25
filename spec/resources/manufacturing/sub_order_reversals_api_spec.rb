require 'spec_helper'

describe Elmas::SubOrderReversal do
  it "can initialize" do
    sub_order_reversal = Elmas::SubOrderReversal.new
    expect(sub_order_reversal).to be_a(Elmas::SubOrderReversal)
  end

  it "accepts attribute setter" do
    sub_order_reversal = Elmas::SubOrderReversal.new
    sub_order_reversal.shop_order_reversal_stock_transaction_id = "78238"
    expect(sub_order_reversal.shop_order_reversal_stock_transaction_id).to eq "78238"
  end

  it "returns value for getters" do
    sub_order_reversal = Elmas::SubOrderReversal.new({ "ShopOrderReversalStockTransactionID" => "345" })
    expect(sub_order_reversal.shop_order_reversal_stock_transaction_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sub_order_reversal = Elmas::SubOrderReversal.new({ this_does_not_exist: "Piet" })
    expect(sub_order_reversal.try(:shop_order_reversal_stock_transaction_id)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sub_order_reversal = Elmas::SubOrderReversal.new(original_material_issue_stock_transaction_id: "OriginalMaterialIssueStockTransactionID", transaction_date: "TransactionDate")
    expect(sub_order_reversal.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sub_order_reversal = Elmas::SubOrderReversal.new
    expect(sub_order_reversal.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SubOrderReversal.new(id: "12abcdef-1234-1234-1234-123456abcdef", shop_order_reversal_stock_transaction_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/SubOrderReversals(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/SubOrderReversals?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/SubOrderReversals?$filter=ShopOrderReversalStockTransactionID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:shop_order_reversal_stock_transaction_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/SubOrderReversals?$orderby=ShopOrderReversalStockTransactionID&$filter=ShopOrderReversalStockTransactionID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:shop_order_reversal_stock_transaction_id, :id], order_by: :shop_order_reversal_stock_transaction_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/SubOrderReversals?$orderby=ShopOrderReversalStockTransactionID")
      resource.find_all(order_by: :shop_order_reversal_stock_transaction_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/SubOrderReversals?$select=ShopOrderReversalStockTransactionID")
      resource.find_all(select: [:shop_order_reversal_stock_transaction_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/SubOrderReversals?$select=ShopOrderReversalStockTransactionID")
      resource.find_by(select: [:shop_order_reversal_stock_transaction_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/SubOrderReversals?$select=ShopOrderReversalStockTransactionID,ID")
      resource.find_all(select: [:shop_order_reversal_stock_transaction_id, :id])
    end
  end
end
