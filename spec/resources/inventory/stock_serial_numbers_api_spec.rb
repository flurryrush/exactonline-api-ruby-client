require 'spec_helper'

describe Elmas::StockSerialNumber do
  it "can initialize" do
    stock_serial_number = Elmas::StockSerialNumber.new
    expect(stock_serial_number).to be_a(Elmas::StockSerialNumber)
  end

  it "accepts attribute setter" do
    stock_serial_number = Elmas::StockSerialNumber.new
    stock_serial_number.creator = "78238"
    expect(stock_serial_number.creator).to eq "78238"
  end

  it "returns value for getters" do
    stock_serial_number = Elmas::StockSerialNumber.new({ "Creator" => "345" })
    expect(stock_serial_number.creator).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    stock_serial_number = Elmas::StockSerialNumber.new({ this_does_not_exist: "Piet" })
    expect(stock_serial_number.try(:creator)).to eq nil
  end

  it "is valid with mandatory attributes" do
    stock_serial_number = Elmas::StockSerialNumber.new(draft_stock_transaction_id: "DraftStockTransactionID", serial_number: "SerialNumber", stock_transaction_type: "StockTransactionType", warehouse: "Warehouse")
    expect(stock_serial_number.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    stock_serial_number = Elmas::StockSerialNumber.new
    expect(stock_serial_number.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::StockSerialNumber.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/StockSerialNumbers(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/StockSerialNumbers?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/StockSerialNumbers?$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/StockSerialNumbers?$orderby=Creator&$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id], order_by: :creator)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/StockSerialNumbers?$orderby=Creator")
      resource.find_all(order_by: :creator)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/StockSerialNumbers?$select=Creator")
      resource.find_all(select: [:creator])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/StockSerialNumbers?$select=Creator")
      resource.find_by(select: [:creator])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/StockSerialNumbers?$select=Creator,ID")
      resource.find_all(select: [:creator, :id])
    end
  end
end
