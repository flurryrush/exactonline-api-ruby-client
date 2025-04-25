require 'spec_helper'

describe Elmas::SyncInventorySerialBatchNumber do
  it "can initialize" do
    sync_inventory_serial_batch_number = Elmas::SyncInventorySerialBatchNumber.new
    expect(sync_inventory_serial_batch_number).to be_a(Elmas::SyncInventorySerialBatchNumber)
  end

  it "accepts attribute setter" do
    sync_inventory_serial_batch_number = Elmas::SyncInventorySerialBatchNumber.new
    sync_inventory_serial_batch_number.creator = "78238"
    expect(sync_inventory_serial_batch_number.creator).to eq "78238"
  end

  it "returns value for getters" do
    sync_inventory_serial_batch_number = Elmas::SyncInventorySerialBatchNumber.new({ "Creator" => "345" })
    expect(sync_inventory_serial_batch_number.creator).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_inventory_serial_batch_number = Elmas::SyncInventorySerialBatchNumber.new({ this_does_not_exist: "Piet" })
    expect(sync_inventory_serial_batch_number.try(:creator)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncInventorySerialBatchNumber.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Inventory/SerialBatchNumbers(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Inventory/SerialBatchNumbers?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Inventory/SerialBatchNumbers?$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Inventory/SerialBatchNumbers?$orderby=Creator&$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id], order_by: :creator)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Inventory/SerialBatchNumbers?$orderby=Creator")
      resource.find_all(order_by: :creator)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Inventory/SerialBatchNumbers?$select=Creator")
      resource.find_all(select: [:creator])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Inventory/SerialBatchNumbers?$select=Creator")
      resource.find_by(select: [:creator])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Inventory/SerialBatchNumbers?$select=Creator,ID")
      resource.find_all(select: [:creator, :id])
    end
  end
end
