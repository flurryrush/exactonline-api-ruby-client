require 'spec_helper'

describe Elmas::SyncLogisticsSupplierItem do
  it "can initialize" do
    sync_logistics_supplier_item = Elmas::SyncLogisticsSupplierItem.new
    expect(sync_logistics_supplier_item).to be_a(Elmas::SyncLogisticsSupplierItem)
  end

  it "accepts attribute setter" do
    sync_logistics_supplier_item = Elmas::SyncLogisticsSupplierItem.new
    sync_logistics_supplier_item.currency_description = "78238"
    expect(sync_logistics_supplier_item.currency_description).to eq "78238"
  end

  it "returns value for getters" do
    sync_logistics_supplier_item = Elmas::SyncLogisticsSupplierItem.new({ "CurrencyDescription" => "345" })
    expect(sync_logistics_supplier_item.currency_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_logistics_supplier_item = Elmas::SyncLogisticsSupplierItem.new({ this_does_not_exist: "Piet" })
    expect(sync_logistics_supplier_item.try(:currency_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_logistics_supplier_item = Elmas::SyncLogisticsSupplierItem.new(item: "Item", item_unit: "ItemUnit", purchase_price: "PurchasePrice", purchase_unit: "PurchaseUnit", supplier: "Supplier")
    expect(sync_logistics_supplier_item.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_logistics_supplier_item = Elmas::SyncLogisticsSupplierItem.new
    expect(sync_logistics_supplier_item.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncLogisticsSupplierItem.new(id: "12abcdef-1234-1234-1234-123456abcdef", currency_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Logistics/SupplierItem(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Logistics/SupplierItem?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Logistics/SupplierItem?$filter=CurrencyDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:currency_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Logistics/SupplierItem?$orderby=CurrencyDescription&$filter=CurrencyDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:currency_description, :id], order_by: :currency_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Logistics/SupplierItem?$orderby=CurrencyDescription")
      resource.find_all(order_by: :currency_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Logistics/SupplierItem?$select=CurrencyDescription")
      resource.find_all(select: [:currency_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Logistics/SupplierItem?$select=CurrencyDescription")
      resource.find_by(select: [:currency_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Logistics/SupplierItem?$select=CurrencyDescription,ID")
      resource.find_all(select: [:currency_description, :id])
    end
  end
end
