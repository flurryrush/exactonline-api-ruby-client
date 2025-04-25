require 'spec_helper'

describe Elmas::PrintedSalesOrder do
  it "can initialize" do
    printed_sales_order = Elmas::PrintedSalesOrder.new
    expect(printed_sales_order).to be_a(Elmas::PrintedSalesOrder)
  end

  it "accepts attribute setter" do
    printed_sales_order = Elmas::PrintedSalesOrder.new
    printed_sales_order.email_layout = "78238"
    expect(printed_sales_order.email_layout).to eq "78238"
  end

  it "returns value for getters" do
    printed_sales_order = Elmas::PrintedSalesOrder.new({ "EmailLayout" => "345" })
    expect(printed_sales_order.email_layout).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    printed_sales_order = Elmas::PrintedSalesOrder.new({ this_does_not_exist: "Piet" })
    expect(printed_sales_order.try(:email_layout)).to eq nil
  end

  it "is valid with mandatory attributes" do
    printed_sales_order = Elmas::PrintedSalesOrder.new(order_id: "OrderID")
    expect(printed_sales_order.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    printed_sales_order = Elmas::PrintedSalesOrder.new
    expect(printed_sales_order.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::PrintedSalesOrder.new(id: "12abcdef-1234-1234-1234-123456abcdef", email_layout: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesorder/PrintedSalesOrders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesorder/PrintedSalesOrders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesorder/PrintedSalesOrders?$filter=EmailLayout eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:email_layout, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("salesorder/PrintedSalesOrders?$orderby=EmailLayout&$filter=EmailLayout eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:email_layout, :id], order_by: :email_layout)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("salesorder/PrintedSalesOrders?$orderby=EmailLayout")
      resource.find_all(order_by: :email_layout)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/PrintedSalesOrders?$select=EmailLayout")
      resource.find_all(select: [:email_layout])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("salesorder/PrintedSalesOrders?$select=EmailLayout")
      resource.find_by(select: [:email_layout])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/PrintedSalesOrders?$select=EmailLayout,ID")
      resource.find_all(select: [:email_layout, :id])
    end
  end
end
