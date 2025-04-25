require 'spec_helper'

describe Elmas::CompleteSalesOrder do
  it "can initialize" do
    complete_sales_order = Elmas::CompleteSalesOrder.new
    expect(complete_sales_order).to be_a(Elmas::CompleteSalesOrder)
  end

  it "accepts attribute setter" do
    complete_sales_order = Elmas::CompleteSalesOrder.new
    complete_sales_order.complete_delivery = "78238"
    expect(complete_sales_order.complete_delivery).to eq "78238"
  end

  it "returns value for getters" do
    complete_sales_order = Elmas::CompleteSalesOrder.new({ "CompleteDelivery" => "345" })
    expect(complete_sales_order.complete_delivery).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    complete_sales_order = Elmas::CompleteSalesOrder.new({ this_does_not_exist: "Piet" })
    expect(complete_sales_order.try(:complete_delivery)).to eq nil
  end

  it "is valid with mandatory attributes" do
    complete_sales_order = Elmas::CompleteSalesOrder.new(order_id: "OrderID")
    expect(complete_sales_order.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    complete_sales_order = Elmas::CompleteSalesOrder.new
    expect(complete_sales_order.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::CompleteSalesOrder.new(id: "12abcdef-1234-1234-1234-123456abcdef", complete_delivery: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrder(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrder?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrder?$filter=CompleteDelivery eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:complete_delivery, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrder?$orderby=CompleteDelivery&$filter=CompleteDelivery eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:complete_delivery, :id], order_by: :complete_delivery)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrder?$orderby=CompleteDelivery")
      resource.find_all(order_by: :complete_delivery)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrder?$select=CompleteDelivery")
      resource.find_all(select: [:complete_delivery])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrder?$select=CompleteDelivery")
      resource.find_by(select: [:complete_delivery])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/CompleteSalesOrder?$select=CompleteDelivery,ID")
      resource.find_all(select: [:complete_delivery, :id])
    end
  end
end
