require 'spec_helper'

describe Elmas::OfficialReturn do
  it "can initialize" do
    official_return = Elmas::OfficialReturn.new
    expect(official_return).to be_a(Elmas::OfficialReturn)
  end

  it "accepts attribute setter" do
    official_return = Elmas::OfficialReturn.new
    official_return.source = "78238"
    expect(official_return.source).to eq "78238"
  end

  it "returns value for getters" do
    official_return = Elmas::OfficialReturn.new({ "Source" => "345" })
    expect(official_return.source).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    official_return = Elmas::OfficialReturn.new({ this_does_not_exist: "Piet" })
    expect(official_return.try(:source)).to eq nil
  end

  it "is valid with mandatory attributes" do
    official_return = Elmas::OfficialReturn.new(frequency: "Frequency", period: "Period", status: "Status", type: "Type", year: "Year")
    expect(official_return.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    official_return = Elmas::OfficialReturn.new
    expect(official_return.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::OfficialReturn.new(id: "12abcdef-1234-1234-1234-123456abcdef", source: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("financial/OfficialReturns(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("financial/OfficialReturns?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("financial/OfficialReturns?$filter=Source eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:source, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("financial/OfficialReturns?$orderby=Source&$filter=Source eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:source, :id], order_by: :source)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("financial/OfficialReturns?$orderby=Source")
      resource.find_all(order_by: :source)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/OfficialReturns?$select=Source")
      resource.find_all(select: [:source])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("financial/OfficialReturns?$select=Source")
      resource.find_by(select: [:source])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/OfficialReturns?$select=Source,ID")
      resource.find_all(select: [:source, :id])
    end
  end
end
