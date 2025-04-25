require 'spec_helper'

describe Elmas::DepreciationMethod do
  it "can initialize" do
    depreciation_method = Elmas::DepreciationMethod.new
    expect(depreciation_method).to be_a(Elmas::DepreciationMethod)
  end

  it "accepts attribute setter" do
    depreciation_method = Elmas::DepreciationMethod.new
    depreciation_method.years = "78238"
    expect(depreciation_method.years).to eq "78238"
  end

  it "returns value for getters" do
    depreciation_method = Elmas::DepreciationMethod.new({ "Years" => "345" })
    expect(depreciation_method.years).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    depreciation_method = Elmas::DepreciationMethod.new({ this_does_not_exist: "Piet" })
    expect(depreciation_method.try(:years)).to eq nil
  end

  it "is valid with mandatory attributes" do
    depreciation_method = Elmas::DepreciationMethod.new(code: "Code", description: "Description")
    expect(depreciation_method.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    depreciation_method = Elmas::DepreciationMethod.new
    expect(depreciation_method.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::DepreciationMethod.new(id: "12abcdef-1234-1234-1234-123456abcdef", years: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("assets/DepreciationMethods(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("assets/DepreciationMethods?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("assets/DepreciationMethods?$filter=Years eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:years, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("assets/DepreciationMethods?$orderby=Years&$filter=Years eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:years, :id], order_by: :years)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("assets/DepreciationMethods?$orderby=Years")
      resource.find_all(order_by: :years)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("assets/DepreciationMethods?$select=Years")
      resource.find_all(select: [:years])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("assets/DepreciationMethods?$select=Years")
      resource.find_by(select: [:years])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("assets/DepreciationMethods?$select=Years,ID")
      resource.find_all(select: [:years, :id])
    end
  end
end
