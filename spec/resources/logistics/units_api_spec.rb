require 'spec_helper'

describe Elmas::Unit do
  it "can initialize" do
    unit = Elmas::Unit.new
    expect(unit).to be_a(Elmas::Unit)
  end

  it "accepts attribute setter" do
    unit = Elmas::Unit.new
    unit.type = "78238"
    expect(unit.type).to eq "78238"
  end

  it "returns value for getters" do
    unit = Elmas::Unit.new({ "Type" => "345" })
    expect(unit.type).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    unit = Elmas::Unit.new({ this_does_not_exist: "Piet" })
    expect(unit.try(:type)).to eq nil
  end



  let(:resource) { resource = Elmas::Unit.new(id: "12abcdef-1234-1234-1234-123456abcdef", type: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("logistics/Units(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("logistics/Units?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("logistics/Units?$filter=Type eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("logistics/Units?$orderby=Type&$filter=Type eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type, :id], order_by: :type)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("logistics/Units?$orderby=Type")
      resource.find_all(order_by: :type)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/Units?$select=Type")
      resource.find_all(select: [:type])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("logistics/Units?$select=Type")
      resource.find_by(select: [:type])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/Units?$select=Type,ID")
      resource.find_all(select: [:type, :id])
    end
  end
end
