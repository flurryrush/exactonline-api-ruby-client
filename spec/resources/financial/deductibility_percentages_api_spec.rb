require 'spec_helper'

describe Elmas::DeductibilityPercentage do
  it "can initialize" do
    deductibility_percentage = Elmas::DeductibilityPercentage.new
    expect(deductibility_percentage).to be_a(Elmas::DeductibilityPercentage)
  end

  it "accepts attribute setter" do
    deductibility_percentage = Elmas::DeductibilityPercentage.new
    deductibility_percentage.line_number = "78238"
    expect(deductibility_percentage.line_number).to eq "78238"
  end

  it "returns value for getters" do
    deductibility_percentage = Elmas::DeductibilityPercentage.new({ "LineNumber" => "345" })
    expect(deductibility_percentage.line_number).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    deductibility_percentage = Elmas::DeductibilityPercentage.new({ this_does_not_exist: "Piet" })
    expect(deductibility_percentage.try(:line_number)).to eq nil
  end

  it "is valid with mandatory attributes" do
    deductibility_percentage = Elmas::DeductibilityPercentage.new(gl_account: "GLAccount")
    expect(deductibility_percentage.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    deductibility_percentage = Elmas::DeductibilityPercentage.new
    expect(deductibility_percentage.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::DeductibilityPercentage.new(id: "12abcdef-1234-1234-1234-123456abcdef", line_number: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("financial/DeductibilityPercentages(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("financial/DeductibilityPercentages?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("financial/DeductibilityPercentages?$filter=LineNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:line_number, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("financial/DeductibilityPercentages?$orderby=LineNumber&$filter=LineNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:line_number, :id], order_by: :line_number)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("financial/DeductibilityPercentages?$orderby=LineNumber")
      resource.find_all(order_by: :line_number)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/DeductibilityPercentages?$select=LineNumber")
      resource.find_all(select: [:line_number])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("financial/DeductibilityPercentages?$select=LineNumber")
      resource.find_by(select: [:line_number])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/DeductibilityPercentages?$select=LineNumber,ID")
      resource.find_all(select: [:line_number, :id])
    end
  end
end
