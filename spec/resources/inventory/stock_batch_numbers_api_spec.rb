require 'spec_helper'

describe Elmas::StockBatchNumber do
  it "can initialize" do
    stock_batch_number = Elmas::StockBatchNumber.new
    expect(stock_batch_number).to be_a(Elmas::StockBatchNumber)
  end

  it "accepts attribute setter" do
    stock_batch_number = Elmas::StockBatchNumber.new
    stock_batch_number.division = "78238"
    expect(stock_batch_number.division).to eq "78238"
  end

  it "returns value for getters" do
    stock_batch_number = Elmas::StockBatchNumber.new({ "Division" => "345" })
    expect(stock_batch_number.division).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    stock_batch_number = Elmas::StockBatchNumber.new({ this_does_not_exist: "Piet" })
    expect(stock_batch_number.try(:division)).to eq nil
  end

  it "is valid with mandatory attributes" do
    stock_batch_number = Elmas::StockBatchNumber.new(batch_number: "BatchNumber", draft_stock_transaction_id: "DraftStockTransactionID", quantity: "Quantity", stock_transaction_type: "StockTransactionType", warehouse: "Warehouse")
    expect(stock_batch_number.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    stock_batch_number = Elmas::StockBatchNumber.new
    expect(stock_batch_number.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::StockBatchNumber.new(id: "12abcdef-1234-1234-1234-123456abcdef", division: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/StockBatchNumbers(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/StockBatchNumbers?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/StockBatchNumbers?$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/StockBatchNumbers?$orderby=Division&$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id], order_by: :division)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/StockBatchNumbers?$orderby=Division")
      resource.find_all(order_by: :division)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/StockBatchNumbers?$select=Division")
      resource.find_all(select: [:division])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/StockBatchNumbers?$select=Division")
      resource.find_by(select: [:division])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/StockBatchNumbers?$select=Division,ID")
      resource.find_all(select: [:division, :id])
    end
  end
end
