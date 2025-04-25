require 'spec_helper'

describe Elmas::SyncPurchaseOrderPurchaseOrder do
  it "can initialize" do
    sync_purchase_order_purchase_order = Elmas::SyncPurchaseOrderPurchaseOrder.new
    expect(sync_purchase_order_purchase_order).to be_a(Elmas::SyncPurchaseOrderPurchaseOrder)
  end

  it "accepts attribute setter" do
    sync_purchase_order_purchase_order = Elmas::SyncPurchaseOrderPurchaseOrder.new
    sync_purchase_order_purchase_order.amount_fc_excl_vat = "78238"
    expect(sync_purchase_order_purchase_order.amount_fc_excl_vat).to eq "78238"
  end

  it "returns value for getters" do
    sync_purchase_order_purchase_order = Elmas::SyncPurchaseOrderPurchaseOrder.new({ "AmountFCExclVAT" => "345" })
    expect(sync_purchase_order_purchase_order.amount_fc_excl_vat).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_purchase_order_purchase_order = Elmas::SyncPurchaseOrderPurchaseOrder.new({ this_does_not_exist: "Piet" })
    expect(sync_purchase_order_purchase_order.try(:amount_fc_excl_vat)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_purchase_order_purchase_order = Elmas::SyncPurchaseOrderPurchaseOrder.new(item: "Item", purchase_order_id: "PurchaseOrderID", quantity_in_purchase_units: "QuantityInPurchaseUnits", supplier: "Supplier")
    expect(sync_purchase_order_purchase_order.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_purchase_order_purchase_order = Elmas::SyncPurchaseOrderPurchaseOrder.new
    expect(sync_purchase_order_purchase_order.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncPurchaseOrderPurchaseOrder.new(id: "12abcdef-1234-1234-1234-123456abcdef", amount_fc_excl_vat: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/PurchaseOrder/PurchaseOrders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/PurchaseOrder/PurchaseOrders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/PurchaseOrder/PurchaseOrders?$filter=AmountFCExclVAT eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_fc_excl_vat, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/PurchaseOrder/PurchaseOrders?$orderby=AmountFCExclVAT&$filter=AmountFCExclVAT eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_fc_excl_vat, :id], order_by: :amount_fc_excl_vat)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/PurchaseOrder/PurchaseOrders?$orderby=AmountFCExclVAT")
      resource.find_all(order_by: :amount_fc_excl_vat)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/PurchaseOrder/PurchaseOrders?$select=AmountFCExclVAT")
      resource.find_all(select: [:amount_fc_excl_vat])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/PurchaseOrder/PurchaseOrders?$select=AmountFCExclVAT")
      resource.find_by(select: [:amount_fc_excl_vat])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/PurchaseOrder/PurchaseOrders?$select=AmountFCExclVAT,ID")
      resource.find_all(select: [:amount_fc_excl_vat, :id])
    end
  end
end
