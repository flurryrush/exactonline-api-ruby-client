require 'spec_helper'

describe Elmas::PurchaseInvoice do
  it "can initialize" do
    purchase_invoice = Elmas::PurchaseInvoice.new
    expect(purchase_invoice).to be_a(Elmas::PurchaseInvoice)
  end

  it "accepts attribute setter" do
    purchase_invoice = Elmas::PurchaseInvoice.new
    purchase_invoice.warehouse = "78238"
    expect(purchase_invoice.warehouse).to eq "78238"
  end

  it "returns value for getters" do
    purchase_invoice = Elmas::PurchaseInvoice.new({ "Warehouse" => "345" })
    expect(purchase_invoice.warehouse).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    purchase_invoice = Elmas::PurchaseInvoice.new({ this_does_not_exist: "Piet" })
    expect(purchase_invoice.try(:warehouse)).to eq nil
  end

  it "is valid with mandatory attributes" do
    purchase_invoice = Elmas::PurchaseInvoice.new(journal: "Journal", purchase_invoice_lines: "PurchaseInvoiceLines", supplier: "Supplier", type: "Type")
    expect(purchase_invoice.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    purchase_invoice = Elmas::PurchaseInvoice.new
    expect(purchase_invoice.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::PurchaseInvoice.new(id: "12abcdef-1234-1234-1234-123456abcdef", warehouse: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("purchase/PurchaseInvoices(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("purchase/PurchaseInvoices?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("purchase/PurchaseInvoices?$filter=Warehouse eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("purchase/PurchaseInvoices?$orderby=Warehouse&$filter=Warehouse eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse, :id], order_by: :warehouse)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("purchase/PurchaseInvoices?$orderby=Warehouse")
      resource.find_all(order_by: :warehouse)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchase/PurchaseInvoices?$select=Warehouse")
      resource.find_all(select: [:warehouse])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("purchase/PurchaseInvoices?$select=Warehouse")
      resource.find_by(select: [:warehouse])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchase/PurchaseInvoices?$select=Warehouse,ID")
      resource.find_all(select: [:warehouse, :id])
    end
  end
end
