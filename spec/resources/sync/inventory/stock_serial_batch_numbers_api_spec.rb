require 'spec_helper'

describe Elmas::SyncInventoryStockSerialBatchNumber do
  it "can initialize" do
    sync_inventory_stock_serial_batch_number = Elmas::SyncInventoryStockSerialBatchNumber.new
    expect(sync_inventory_stock_serial_batch_number).to be_a(Elmas::SyncInventoryStockSerialBatchNumber)
  end

  it "accepts attribute setter" do
    sync_inventory_stock_serial_batch_number = Elmas::SyncInventoryStockSerialBatchNumber.new
    sync_inventory_stock_serial_batch_number.storage_location = "78238"
    expect(sync_inventory_stock_serial_batch_number.storage_location).to eq "78238"
  end

  it "returns value for getters" do
    sync_inventory_stock_serial_batch_number = Elmas::SyncInventoryStockSerialBatchNumber.new({ "StorageLocation" => "345" })
    expect(sync_inventory_stock_serial_batch_number.storage_location).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_inventory_stock_serial_batch_number = Elmas::SyncInventoryStockSerialBatchNumber.new({ this_does_not_exist: "Piet" })
    expect(sync_inventory_stock_serial_batch_number.try(:storage_location)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_inventory_stock_serial_batch_number = Elmas::SyncInventoryStockSerialBatchNumber.new(stock_transaction_type: "StockTransactionType")
    expect(sync_inventory_stock_serial_batch_number.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_inventory_stock_serial_batch_number = Elmas::SyncInventoryStockSerialBatchNumber.new
    expect(sync_inventory_stock_serial_batch_number.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncInventoryStockSerialBatchNumber.new(id: "12abcdef-1234-1234-1234-123456abcdef", storage_location: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Inventory/StockSerialBatchNumbers(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Inventory/StockSerialBatchNumbers?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Inventory/StockSerialBatchNumbers?$filter=StorageLocation eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:storage_location, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Inventory/StockSerialBatchNumbers?$orderby=StorageLocation&$filter=StorageLocation eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:storage_location, :id], order_by: :storage_location)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Inventory/StockSerialBatchNumbers?$orderby=StorageLocation")
      resource.find_all(order_by: :storage_location)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Inventory/StockSerialBatchNumbers?$select=StorageLocation")
      resource.find_all(select: [:storage_location])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Inventory/StockSerialBatchNumbers?$select=StorageLocation")
      resource.find_by(select: [:storage_location])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Inventory/StockSerialBatchNumbers?$select=StorageLocation,ID")
      resource.find_all(select: [:storage_location, :id])
    end
  end
end
