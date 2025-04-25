require 'spec_helper'

describe Elmas::ProductionArea do
  it "can initialize" do
    production_area = Elmas::ProductionArea.new
    expect(production_area).to be_a(Elmas::ProductionArea)
  end

  it "accepts attribute setter" do
    production_area = Elmas::ProductionArea.new
    production_area.created = "78238"
    expect(production_area.created).to eq "78238"
  end

  it "returns value for getters" do
    production_area = Elmas::ProductionArea.new({ "Created" => "345" })
    expect(production_area.created).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    production_area = Elmas::ProductionArea.new({ this_does_not_exist: "Piet" })
    expect(production_area.try(:created)).to eq nil
  end

  it "is valid with mandatory attributes" do
    production_area = Elmas::ProductionArea.new(code: "Code", description: "Description")
    expect(production_area.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    production_area = Elmas::ProductionArea.new
    expect(production_area.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProductionArea.new(id: "12abcdef-1234-1234-1234-123456abcdef", created: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ProductionAreas(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ProductionAreas?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ProductionAreas?$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ProductionAreas?$orderby=Created&$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id], order_by: :created)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ProductionAreas?$orderby=Created")
      resource.find_all(order_by: :created)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ProductionAreas?$select=Created")
      resource.find_all(select: [:created])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ProductionAreas?$select=Created")
      resource.find_by(select: [:created])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ProductionAreas?$select=Created,ID")
      resource.find_all(select: [:created, :id])
    end
  end
end
