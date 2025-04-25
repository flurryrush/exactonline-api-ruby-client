require 'spec_helper'

describe Elmas::CompleteSalesOrderLine do
  it "can initialize" do
    complete_sales_order_line = Elmas::CompleteSalesOrderLine.new
    expect(complete_sales_order_line).to be_a(Elmas::CompleteSalesOrderLine)
  end

  it "accepts attribute setter" do
    complete_sales_order_line = Elmas::CompleteSalesOrderLine.new
    complete_sales_order_line.complete_invoice = "78238"
    expect(complete_sales_order_line.complete_invoice).to eq "78238"
  end

  it "returns value for getters" do
    complete_sales_order_line = Elmas::CompleteSalesOrderLine.new({ "CompleteInvoice" => "345" })
    expect(complete_sales_order_line.complete_invoice).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    complete_sales_order_line = Elmas::CompleteSalesOrderLine.new({ this_does_not_exist: "Piet" })
    expect(complete_sales_order_line.try(:complete_invoice)).to eq nil
  end



  let(:resource) { resource = Elmas::CompleteSalesOrderLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", complete_invoice: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrderLine(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrderLine?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrderLine?$filter=CompleteInvoice eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:complete_invoice, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrderLine?$orderby=CompleteInvoice&$filter=CompleteInvoice eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:complete_invoice, :id], order_by: :complete_invoice)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrderLine?$orderby=CompleteInvoice")
      resource.find_all(order_by: :complete_invoice)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrderLine?$select=CompleteInvoice")
      resource.find_all(select: [:complete_invoice])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrderLine?$select=CompleteInvoice")
      resource.find_by(select: [:complete_invoice])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrderLine?$select=CompleteInvoice,ID")
      resource.find_all(select: [:complete_invoice, :id])
    end
  end
end
