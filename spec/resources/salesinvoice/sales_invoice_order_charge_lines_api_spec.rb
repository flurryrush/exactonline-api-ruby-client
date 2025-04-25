require 'spec_helper'

describe Elmas::SalesInvoiceOrderChargeLine do
  it "can initialize" do
    sales_invoice_order_charge_line = Elmas::SalesInvoiceOrderChargeLine.new
    expect(sales_invoice_order_charge_line).to be_a(Elmas::SalesInvoiceOrderChargeLine)
  end

  it "accepts attribute setter" do
    sales_invoice_order_charge_line = Elmas::SalesInvoiceOrderChargeLine.new
    sales_invoice_order_charge_line.division = "78238"
    expect(sales_invoice_order_charge_line.division).to eq "78238"
  end

  it "returns value for getters" do
    sales_invoice_order_charge_line = Elmas::SalesInvoiceOrderChargeLine.new({ "Division" => "345" })
    expect(sales_invoice_order_charge_line.division).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sales_invoice_order_charge_line = Elmas::SalesInvoiceOrderChargeLine.new({ this_does_not_exist: "Piet" })
    expect(sales_invoice_order_charge_line.try(:division)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sales_invoice_order_charge_line = Elmas::SalesInvoiceOrderChargeLine.new(invoice_id: "InvoiceID")
    expect(sales_invoice_order_charge_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sales_invoice_order_charge_line = Elmas::SalesInvoiceOrderChargeLine.new
    expect(sales_invoice_order_charge_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SalesInvoiceOrderChargeLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", division: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceOrderChargeLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceOrderChargeLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceOrderChargeLines?$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceOrderChargeLines?$orderby=Division&$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id], order_by: :division)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceOrderChargeLines?$orderby=Division")
      resource.find_all(order_by: :division)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceOrderChargeLines?$select=Division")
      resource.find_all(select: [:division])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceOrderChargeLines?$select=Division")
      resource.find_by(select: [:division])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceOrderChargeLines?$select=Division,ID")
      resource.find_all(select: [:division, :id])
    end
  end
end
