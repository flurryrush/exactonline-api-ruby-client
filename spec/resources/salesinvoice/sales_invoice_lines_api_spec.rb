require 'spec_helper'

describe Elmas::SalesInvoiceLine do
  it "can initialize" do
    sales_invoice_line = Elmas::SalesInvoiceLine.new
    expect(sales_invoice_line).to be_a(Elmas::SalesInvoiceLine)
  end

  it "is not valid without certain attributes" do
    sales_invoice_line = Elmas::SalesInvoiceLine.new
    expect(sales_invoice_line.valid?).to eq(false)
  end

  it "is valid with certain attributes" do
    sales_invoice_line = Elmas::SalesInvoiceLine.new(
      gl_account: "foobar",
      invoice_id:"627362",
      item: "23873",
      quantity: 1,
      description: "description",
      vat_code: 0,
      unit_price: 1.1
    )
    expect(sales_invoice_line.valid?).to eq(true)
  end

  it "is valid with mandatory attributes" do
    sales_entry_line = Elmas::SalesInvoiceLine.new(
      invoice_id:"627362",
      item: "23873",
      quantity: 1,
      gl_account: "foobar",
      description: "description",
      vat_code: 0,
      unit_price: 1.1
    )
    expect(sales_entry_line.valid?).to eq(true)
  end

  it "is not valid without mandatory attributes" do
    sales_entry_line = Elmas::SalesInvoiceLine.new
    expect(sales_entry_line.valid?).to eq(false)
  end

  let(:resource) { Elmas::SalesInvoiceLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", item: "22") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceLines?$filter=Item eq '22'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item, :id])
    end

    it "should apply greater-than filters" do
      resource = Elmas::SalesInvoiceLine.new(net_price: { gt: 5 })
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceLines?$filter=NetPrice gt 5")
      resource.find_by(filters: [:net_price])
    end

    it "should apply less-than filters" do
      resource = Elmas::SalesInvoiceLine.new(net_price: { lt: 5 })
      expect(Elmas).to receive(:get).with("salesinvoice/SalesInvoiceLines?$filter=NetPrice lt 5")
      resource.find_by(filters: [:net_price])
    end
  end

  [
    :employee, :end_time, :line_number, :start_time, :subscription,
    :VAT_amount_DC, :VAT_amount_FC, :GL_account, :discount, :unit_price
  ].each do |attribute|
    normalized_attribute = Elmas::Utils.normalize_hash_key(attribute.to_s).to_sym

    # TODO: (Korstiaan) Fix specs.
    # context attribute.to_s do
    #   it "accepts attribute setter"  do
    #     sales_entry_line = Elmas::SalesInvoiceLine.new
    #     sales_entry_line.public_send("#{normalized_attribute}=", "78238")
    #     expect(sales_entry_line.public_send(normalized_attribute)).to eq "78238"
    #   end
    #
    #   it "returns value for getters"
    #    do
    #
    #     sales_entry_line = Elmas::SalesInvoiceLine.new({ "#{attribute}" => "345" })
    #     expect(sales_entry_line.public_send(normalized_attribute)).to eq "345"
    #   end
    # end
  end
end
