require 'spec_helper'

describe Elmas::SyncSalesInvoiceSalesInvoice do
  it "can initialize" do
    sync_sales_invoice_sales_invoice = Elmas::SyncSalesInvoiceSalesInvoice.new
    expect(sync_sales_invoice_sales_invoice).to be_a(Elmas::SyncSalesInvoiceSalesInvoice)
  end

  it "accepts attribute setter" do
    sync_sales_invoice_sales_invoice = Elmas::SyncSalesInvoiceSalesInvoice.new
    sync_sales_invoice_sales_invoice.cost_unit_description = "78238"
    expect(sync_sales_invoice_sales_invoice.cost_unit_description).to eq "78238"
  end

  it "returns value for getters" do
    sync_sales_invoice_sales_invoice = Elmas::SyncSalesInvoiceSalesInvoice.new({ "CostUnitDescription" => "345" })
    expect(sync_sales_invoice_sales_invoice.cost_unit_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_sales_invoice_sales_invoice = Elmas::SyncSalesInvoiceSalesInvoice.new({ this_does_not_exist: "Piet" })
    expect(sync_sales_invoice_sales_invoice.try(:cost_unit_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_sales_invoice_sales_invoice = Elmas::SyncSalesInvoiceSalesInvoice.new(gl_account: "GLAccount", invoice_id: "InvoiceID", item: "Item", journal: "Journal", ordered_by: "OrderedBy")
    expect(sync_sales_invoice_sales_invoice.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_sales_invoice_sales_invoice = Elmas::SyncSalesInvoiceSalesInvoice.new
    expect(sync_sales_invoice_sales_invoice.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncSalesInvoiceSalesInvoice.new(id: "12abcdef-1234-1234-1234-123456abcdef", cost_unit_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/SalesInvoice/SalesInvoices(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/SalesInvoice/SalesInvoices?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/SalesInvoice/SalesInvoices?$filter=CostUnitDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_unit_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/SalesInvoice/SalesInvoices?$orderby=CostUnitDescription&$filter=CostUnitDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_unit_description, :id], order_by: :cost_unit_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/SalesInvoice/SalesInvoices?$orderby=CostUnitDescription")
      resource.find_all(order_by: :cost_unit_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/SalesInvoice/SalesInvoices?$select=CostUnitDescription")
      resource.find_all(select: [:cost_unit_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/SalesInvoice/SalesInvoices?$select=CostUnitDescription")
      resource.find_by(select: [:cost_unit_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/SalesInvoice/SalesInvoices?$select=CostUnitDescription,ID")
      resource.find_all(select: [:cost_unit_description, :id])
    end
  end
end
