require 'spec_helper'

describe Elmas::QuotationLine do
  it "can initialize" do
    quotation_line = Elmas::QuotationLine.new
    expect(quotation_line).to be_a(Elmas::QuotationLine)
  end

  it "accepts attribute setter" do
    quotation_line = Elmas::QuotationLine.new
    quotation_line.cost_unit = "78238"
    expect(quotation_line.cost_unit).to eq "78238"
  end

  it "returns value for getters" do
    quotation_line = Elmas::QuotationLine.new({ "CostUnit" => "345" })
    expect(quotation_line.cost_unit).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    quotation_line = Elmas::QuotationLine.new({ this_does_not_exist: "Piet" })
    expect(quotation_line.try(:cost_unit)).to eq nil
  end

  it "is valid with mandatory attributes" do
    quotation_line = Elmas::QuotationLine.new(item: "Item", quotation_id: "QuotationID")
    expect(quotation_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    quotation_line = Elmas::QuotationLine.new
    expect(quotation_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::QuotationLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", cost_unit: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/QuotationLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/QuotationLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/QuotationLines?$filter=CostUnit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_unit, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/QuotationLines?$orderby=CostUnit&$filter=CostUnit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_unit, :id], order_by: :cost_unit)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/QuotationLines?$orderby=CostUnit")
      resource.find_all(order_by: :cost_unit)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/QuotationLines?$select=CostUnit")
      resource.find_all(select: [:cost_unit])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/QuotationLines?$select=CostUnit")
      resource.find_by(select: [:cost_unit])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/QuotationLines?$select=CostUnit,ID")
      resource.find_all(select: [:cost_unit, :id])
    end
  end
end
