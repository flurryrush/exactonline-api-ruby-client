require 'spec_helper'

describe Elmas::Quotation do
  it "can initialize" do
    quotation = Elmas::Quotation.new
    expect(quotation).to be_a(Elmas::Quotation)
  end

  it "accepts attribute setter" do
    quotation = Elmas::Quotation.new
    quotation.warehouse_code = "78238"
    expect(quotation.warehouse_code).to eq "78238"
  end

  it "returns value for getters" do
    quotation = Elmas::Quotation.new({ "WarehouseCode" => "345" })
    expect(quotation.warehouse_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    quotation = Elmas::Quotation.new({ this_does_not_exist: "Piet" })
    expect(quotation.try(:warehouse_code)).to eq nil
  end

  it "is valid with mandatory attributes" do
    quotation = Elmas::Quotation.new(order_account: "OrderAccount", quotation_lines: "QuotationLines")
    expect(quotation.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    quotation = Elmas::Quotation.new
    expect(quotation.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::Quotation.new(id: "12abcdef-1234-1234-1234-123456abcdef", warehouse_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/Quotations(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/Quotations?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/Quotations?$filter=WarehouseCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/Quotations?$orderby=WarehouseCode&$filter=WarehouseCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse_code, :id], order_by: :warehouse_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/Quotations?$orderby=WarehouseCode")
      resource.find_all(order_by: :warehouse_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/Quotations?$select=WarehouseCode")
      resource.find_all(select: [:warehouse_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/Quotations?$select=WarehouseCode")
      resource.find_by(select: [:warehouse_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/Quotations?$select=WarehouseCode,ID")
      resource.find_all(select: [:warehouse_code, :id])
    end
  end
end
