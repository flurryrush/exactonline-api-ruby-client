require 'spec_helper'

describe Elmas::PurchaseInvoiceLine do
  it "can initialize" do
    purchase_invoice_line = Elmas::PurchaseInvoiceLine.new
    expect(purchase_invoice_line).to be_a(Elmas::PurchaseInvoiceLine)
  end

  it "accepts attribute setter" do
    purchase_invoice_line = Elmas::PurchaseInvoiceLine.new
    purchase_invoice_line.unit = "78238"
    expect(purchase_invoice_line.unit).to eq "78238"
  end

  it "returns value for getters" do
    purchase_invoice_line = Elmas::PurchaseInvoiceLine.new({ "Unit" => "345" })
    expect(purchase_invoice_line.unit).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    purchase_invoice_line = Elmas::PurchaseInvoiceLine.new({ this_does_not_exist: "Piet" })
    expect(purchase_invoice_line.try(:unit)).to eq nil
  end



  let(:resource) { resource = Elmas::PurchaseInvoiceLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", unit: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("purchase/PurchaseInvoiceLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("purchase/PurchaseInvoiceLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("purchase/PurchaseInvoiceLines?$filter=Unit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:unit, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("purchase/PurchaseInvoiceLines?$orderby=Unit&$filter=Unit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:unit, :id], order_by: :unit)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("purchase/PurchaseInvoiceLines?$orderby=Unit")
      resource.find_all(order_by: :unit)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchase/PurchaseInvoiceLines?$select=Unit")
      resource.find_all(select: [:unit])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("purchase/PurchaseInvoiceLines?$select=Unit")
      resource.find_by(select: [:unit])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchase/PurchaseInvoiceLines?$select=Unit,ID")
      resource.find_all(select: [:unit, :id])
    end
  end
end
