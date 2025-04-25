require 'spec_helper'

describe Elmas::InvoiceSalesOrder do
  it "can initialize" do
    invoice_sales_order = Elmas::InvoiceSalesOrder.new
    expect(invoice_sales_order).to be_a(Elmas::InvoiceSalesOrder)
  end

  it "accepts attribute setter" do
    invoice_sales_order = Elmas::InvoiceSalesOrder.new
    invoice_sales_order.delivery_number = "78238"
    expect(invoice_sales_order.delivery_number).to eq "78238"
  end

  it "returns value for getters" do
    invoice_sales_order = Elmas::InvoiceSalesOrder.new({ "DeliveryNumber" => "345" })
    expect(invoice_sales_order.delivery_number).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    invoice_sales_order = Elmas::InvoiceSalesOrder.new({ this_does_not_exist: "Piet" })
    expect(invoice_sales_order.try(:delivery_number)).to eq nil
  end

  it "is valid with mandatory attributes" do
    invoice_sales_order = Elmas::InvoiceSalesOrder.new(create_mode: "CreateMode", invoice_mode: "InvoiceMode", journal_code: "JournalCode", sales_order_ids: "SalesOrderIDs")
    expect(invoice_sales_order.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    invoice_sales_order = Elmas::InvoiceSalesOrder.new
    expect(invoice_sales_order.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::InvoiceSalesOrder.new(id: "12abcdef-1234-1234-1234-123456abcdef", delivery_number: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesinvoice/InvoiceSalesOrders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesinvoice/InvoiceSalesOrders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesinvoice/InvoiceSalesOrders?$filter=DeliveryNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:delivery_number, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("salesinvoice/InvoiceSalesOrders?$orderby=DeliveryNumber&$filter=DeliveryNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:delivery_number, :id], order_by: :delivery_number)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("salesinvoice/InvoiceSalesOrders?$orderby=DeliveryNumber")
      resource.find_all(order_by: :delivery_number)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesinvoice/InvoiceSalesOrders?$select=DeliveryNumber")
      resource.find_all(select: [:delivery_number])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("salesinvoice/InvoiceSalesOrders?$select=DeliveryNumber")
      resource.find_by(select: [:delivery_number])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesinvoice/InvoiceSalesOrders?$select=DeliveryNumber,ID")
      resource.find_all(select: [:delivery_number, :id])
    end
  end
end
