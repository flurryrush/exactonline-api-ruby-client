require 'spec_helper'

describe Elmas::ProcessWarehouseTransfer do
  it "can initialize" do
    process_warehouse_transfer = Elmas::ProcessWarehouseTransfer.new
    expect(process_warehouse_transfer).to be_a(Elmas::ProcessWarehouseTransfer)
  end

  it "accepts attribute setter" do
    process_warehouse_transfer = Elmas::ProcessWarehouseTransfer.new
    process_warehouse_transfer.transfer_date = "78238"
    expect(process_warehouse_transfer.transfer_date).to eq "78238"
  end

  it "returns value for getters" do
    process_warehouse_transfer = Elmas::ProcessWarehouseTransfer.new({ "TransferDate" => "345" })
    expect(process_warehouse_transfer.transfer_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    process_warehouse_transfer = Elmas::ProcessWarehouseTransfer.new({ this_does_not_exist: "Piet" })
    expect(process_warehouse_transfer.try(:transfer_date)).to eq nil
  end

  it "is valid with mandatory attributes" do
    process_warehouse_transfer = Elmas::ProcessWarehouseTransfer.new(transfer_id: "TransferID")
    expect(process_warehouse_transfer.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    process_warehouse_transfer = Elmas::ProcessWarehouseTransfer.new
    expect(process_warehouse_transfer.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProcessWarehouseTransfer.new(id: "12abcdef-1234-1234-1234-123456abcdef", transfer_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/ProcessWarehouseTransfer(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/ProcessWarehouseTransfer?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/ProcessWarehouseTransfer?$filter=TransferDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:transfer_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/ProcessWarehouseTransfer?$orderby=TransferDate&$filter=TransferDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:transfer_date, :id], order_by: :transfer_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/ProcessWarehouseTransfer?$orderby=TransferDate")
      resource.find_all(order_by: :transfer_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/ProcessWarehouseTransfer?$select=TransferDate")
      resource.find_all(select: [:transfer_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/ProcessWarehouseTransfer?$select=TransferDate")
      resource.find_by(select: [:transfer_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/ProcessWarehouseTransfer?$select=TransferDate,ID")
      resource.find_all(select: [:transfer_date, :id])
    end
  end
end
