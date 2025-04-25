require 'spec_helper'

describe Elmas::BulkSalesInvoiceSalesInvoice do
  it "can initialize" do
    bulk_sales_invoice_sales_invoice = Elmas::BulkSalesInvoiceSalesInvoice.new
    expect(bulk_sales_invoice_sales_invoice).to be_a(Elmas::BulkSalesInvoiceSalesInvoice)
  end

  it "accepts attribute setter" do
    bulk_sales_invoice_sales_invoice = Elmas::BulkSalesInvoiceSalesInvoice.new
    bulk_sales_invoice_sales_invoice.tax_schedule_description = "78238"
    expect(bulk_sales_invoice_sales_invoice.tax_schedule_description).to eq "78238"
  end

  it "returns value for getters" do
    bulk_sales_invoice_sales_invoice = Elmas::BulkSalesInvoiceSalesInvoice.new({ "TaxScheduleDescription" => "345" })
    expect(bulk_sales_invoice_sales_invoice.tax_schedule_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_sales_invoice_sales_invoice = Elmas::BulkSalesInvoiceSalesInvoice.new({ this_does_not_exist: "Piet" })
    expect(bulk_sales_invoice_sales_invoice.try(:tax_schedule_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_sales_invoice_sales_invoice = Elmas::BulkSalesInvoiceSalesInvoice.new(journal: "Journal", ordered_by: "OrderedBy", sales_invoice_lines: "SalesInvoiceLines")
    expect(bulk_sales_invoice_sales_invoice.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_sales_invoice_sales_invoice = Elmas::BulkSalesInvoiceSalesInvoice.new
    expect(bulk_sales_invoice_sales_invoice.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkSalesInvoiceSalesInvoice.new(id: "12abcdef-1234-1234-1234-123456abcdef", tax_schedule_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoices(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoices?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoices?$filter=TaxScheduleDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:tax_schedule_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoices?$orderby=TaxScheduleDescription&$filter=TaxScheduleDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:tax_schedule_description, :id], order_by: :tax_schedule_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoices?$orderby=TaxScheduleDescription")
      resource.find_all(order_by: :tax_schedule_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoices?$select=TaxScheduleDescription")
      resource.find_all(select: [:tax_schedule_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoices?$select=TaxScheduleDescription")
      resource.find_by(select: [:tax_schedule_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/SalesInvoice/SalesInvoices?$select=TaxScheduleDescription,ID")
      resource.find_all(select: [:tax_schedule_description, :id])
    end
  end
end
