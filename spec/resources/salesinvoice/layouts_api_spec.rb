require 'spec_helper'

describe Elmas::SalesInvoiceLayout do
  it "can initialize" do
    sales_invoice = Elmas::SalesInvoiceLayout.new
    expect(sales_invoice).to be_a(Elmas::SalesInvoiceLayout)
  end

  it "is valid without attributes" do
    sales_invoice = Elmas::SalesInvoiceLayout.new
    expect(sales_invoice.valid?).to eq(true)
  end

  it "is valid with attributes" do
    sales_invoice = Elmas::SalesInvoiceLayout.new(creator_full_name: "Mario")
    expect(sales_invoice.valid?).to eq(true)
  end

  context "Applying filters" do
    resource = Elmas::SalesInvoiceLayout.new(id: 123)
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesinvoice/Layouts(guid'123')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      resource = Elmas::SalesInvoiceLayout.new(type: 2)
      expect(Elmas).to receive(:get).with("salesinvoice/Layouts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      resource = Elmas::SalesInvoiceLayout.new(id: "12abcdef-1234-1234-1234-123456abcdef", type: "2")
      expect(Elmas).to receive(:get).with("salesinvoice/Layouts?$filter=Type eq '2'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type, :id])
    end
  end
end
