require 'spec_helper'

describe Elmas::SalesOrderOrderChargeLine do
  it "can initialize" do
    sales_order_order_charge_line = Elmas::SalesOrderOrderChargeLine.new
    expect(sales_order_order_charge_line).to be_a(Elmas::SalesOrderOrderChargeLine)
  end

  it "accepts attribute setter" do
    sales_order_order_charge_line = Elmas::SalesOrderOrderChargeLine.new
    sales_order_order_charge_line.order_charges_line_description = "78238"
    expect(sales_order_order_charge_line.order_charges_line_description).to eq "78238"
  end

  it "returns value for getters" do
    sales_order_order_charge_line = Elmas::SalesOrderOrderChargeLine.new({ "OrderChargesLineDescription" => "345" })
    expect(sales_order_order_charge_line.order_charges_line_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sales_order_order_charge_line = Elmas::SalesOrderOrderChargeLine.new({ this_does_not_exist: "Piet" })
    expect(sales_order_order_charge_line.try(:order_charges_line_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sales_order_order_charge_line = Elmas::SalesOrderOrderChargeLine.new(order_id: "OrderID")
    expect(sales_order_order_charge_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sales_order_order_charge_line = Elmas::SalesOrderOrderChargeLine.new
    expect(sales_order_order_charge_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SalesOrderOrderChargeLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", order_charges_line_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("salesorder/SalesOrderOrderChargeLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("salesorder/SalesOrderOrderChargeLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("salesorder/SalesOrderOrderChargeLines?$filter=OrderChargesLineDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:order_charges_line_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("salesorder/SalesOrderOrderChargeLines?$orderby=OrderChargesLineDescription&$filter=OrderChargesLineDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:order_charges_line_description, :id], order_by: :order_charges_line_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("salesorder/SalesOrderOrderChargeLines?$orderby=OrderChargesLineDescription")
      resource.find_all(order_by: :order_charges_line_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/SalesOrderOrderChargeLines?$select=OrderChargesLineDescription")
      resource.find_all(select: [:order_charges_line_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("salesorder/SalesOrderOrderChargeLines?$select=OrderChargesLineDescription")
      resource.find_by(select: [:order_charges_line_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("salesorder/SalesOrderOrderChargeLines?$select=OrderChargesLineDescription,ID")
      resource.find_all(select: [:order_charges_line_description, :id])
    end
  end
end
