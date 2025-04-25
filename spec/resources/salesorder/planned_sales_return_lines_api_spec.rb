require 'spec_helper'

describe Elmas::PlannedSalesReturnLine do
  it "can initialize" do
    planned_sales_return_line = Elmas::PlannedSalesReturnLine.new
    expect(planned_sales_return_line).to be_a(Elmas::PlannedSalesReturnLine)
  end

  it "accepts attribute setter" do
    planned_sales_return_line = Elmas::PlannedSalesReturnLine.new
    planned_sales_return_line.storage_location_description = "78238"
    expect(planned_sales_return_line.storage_location_description).to eq "78238"
  end

  it "returns value for getters" do
    planned_sales_return_line = Elmas::PlannedSalesReturnLine.new({ "StorageLocationDescription" => "345" })
    expect(planned_sales_return_line.storage_location_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    planned_sales_return_line = Elmas::PlannedSalesReturnLine.new({ this_does_not_exist: "Piet" })
    expect(planned_sales_return_line.try(:storage_location_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    planned_sales_return_line = Elmas::PlannedSalesReturnLine.new(create_credit: "CreateCredit", good_delivery_line_id: "GoodDeliveryLineID", item: "Item", planned_return_quantity: "PlannedReturnQuantity", received_quantity: "ReceivedQuantity")
    expect(planned_sales_return_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    planned_sales_return_line = Elmas::PlannedSalesReturnLine.new
    expect(planned_sales_return_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::PlannedSalesReturnLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", storage_location_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturnLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturnLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturnLines?$filter=StorageLocationDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:storage_location_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturnLines?$orderby=StorageLocationDescription&$filter=StorageLocationDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:storage_location_description, :id], order_by: :storage_location_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturnLines?$orderby=StorageLocationDescription")
      resource.find_all(order_by: :storage_location_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturnLines?$select=StorageLocationDescription")
      resource.find_all(select: [:storage_location_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturnLines?$select=StorageLocationDescription")
      resource.find_by(select: [:storage_location_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/PlannedSalesReturnLines?$select=StorageLocationDescription,ID")
      resource.find_all(select: [:storage_location_description, :id])
    end
  end
end
