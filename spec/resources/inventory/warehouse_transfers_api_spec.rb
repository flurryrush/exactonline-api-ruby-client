require 'spec_helper'

describe Elmas::WarehouseTransfer do
  it "can initialize" do
    warehouse_transfer = Elmas::WarehouseTransfer.new
    expect(warehouse_transfer).to be_a(Elmas::WarehouseTransfer)
  end

  it "accepts attribute setter" do
    warehouse_transfer = Elmas::WarehouseTransfer.new
    warehouse_transfer.description = "78238"
    expect(warehouse_transfer.description).to eq "78238"
  end

  it "returns value for getters" do
    warehouse_transfer = Elmas::WarehouseTransfer.new({ "Description" => "345" })
    expect(warehouse_transfer.description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    warehouse_transfer = Elmas::WarehouseTransfer.new({ this_does_not_exist: "Piet" })
    expect(warehouse_transfer.try(:description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    warehouse_transfer = Elmas::WarehouseTransfer.new(entry_date: "EntryDate", warehouse_from: "WarehouseFrom", warehouse_to: "WarehouseTo", warehouse_transfer_lines: "WarehouseTransferLines")
    expect(warehouse_transfer.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    warehouse_transfer = Elmas::WarehouseTransfer.new
    expect(warehouse_transfer.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::WarehouseTransfer.new(id: "12abcdef-1234-1234-1234-123456abcdef", description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/WarehouseTransfers(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/WarehouseTransfers?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/WarehouseTransfers?$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/WarehouseTransfers?$orderby=Description&$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id], order_by: :description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/WarehouseTransfers?$orderby=Description")
      resource.find_all(order_by: :description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/WarehouseTransfers?$select=Description")
      resource.find_all(select: [:description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/WarehouseTransfers?$select=Description")
      resource.find_by(select: [:description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/WarehouseTransfers?$select=Description,ID")
      resource.find_all(select: [:description, :id])
    end
  end
end
