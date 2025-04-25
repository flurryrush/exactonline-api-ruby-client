require 'spec_helper'

describe Elmas::BulkSalesInvoiceSalesInvoiceLine do
  it "can initialize" do
    bulk_sales_invoice_sales_invoice_line = Elmas::BulkSalesInvoiceSalesInvoiceLine.new
    expect(bulk_sales_invoice_sales_invoice_line).to be_a(Elmas::BulkSalesInvoiceSalesInvoiceLine)
  end

  it "accepts attribute setter" do
    bulk_sales_invoice_sales_invoice_line = Elmas::BulkSalesInvoiceSalesInvoiceLine.new
    bulk_sales_invoice_sales_invoice_line.pricelist_description = "78238"
    expect(bulk_sales_invoice_sales_invoice_line.pricelist_description).to eq "78238"
  end

  it "returns value for getters" do
    bulk_sales_invoice_sales_invoice_line = Elmas::BulkSalesInvoiceSalesInvoiceLine.new({ "PricelistDescription" => "345" })
    expect(bulk_sales_invoice_sales_invoice_line.pricelist_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_sales_invoice_sales_invoice_line = Elmas::BulkSalesInvoiceSalesInvoiceLine.new({ this_does_not_exist: "Piet" })
    expect(bulk_sales_invoice_sales_invoice_line.try(:pricelist_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_sales_invoice_sales_invoice_line = Elmas::BulkSalesInvoiceSalesInvoiceLine.new(gl_account: "GLAccount", invoice_id: "InvoiceID", item: "Item")
    expect(bulk_sales_invoice_sales_invoice_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_sales_invoice_sales_invoice_line = Elmas::BulkSalesInvoiceSalesInvoiceLine.new
    expect(bulk_sales_invoice_sales_invoice_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkSalesInvoiceSalesInvoiceLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", pricelist_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoiceLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoiceLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoiceLines?$filter=PricelistDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:pricelist_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoiceLines?$orderby=PricelistDescription&$filter=PricelistDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:pricelist_description, :id], order_by: :pricelist_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoiceLines?$orderby=PricelistDescription")
      resource.find_all(order_by: :pricelist_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoiceLines?$select=PricelistDescription")
      resource.find_all(select: [:pricelist_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoiceLines?$select=PricelistDescription")
      resource.find_by(select: [:pricelist_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoiceLines?$select=PricelistDescription,ID")
      resource.find_all(select: [:pricelist_description, :id])
    end
  end
end
