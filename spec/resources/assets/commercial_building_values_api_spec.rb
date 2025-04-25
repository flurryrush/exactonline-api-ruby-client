require 'spec_helper'

describe Elmas::CommercialBuildingValue do
  it "can initialize" do
    commercial_building_value = Elmas::CommercialBuildingValue.new
    expect(commercial_building_value).to be_a(Elmas::CommercialBuildingValue)
  end

  it "accepts attribute setter" do
    commercial_building_value = Elmas::CommercialBuildingValue.new
    commercial_building_value.asset = "78238"
    expect(commercial_building_value.asset).to eq "78238"
  end

  it "returns value for getters" do
    commercial_building_value = Elmas::CommercialBuildingValue.new({ "Asset" => "345" })
    expect(commercial_building_value.asset).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    commercial_building_value = Elmas::CommercialBuildingValue.new({ this_does_not_exist: "Piet" })
    expect(commercial_building_value.try(:asset)).to eq nil
  end



  let(:resource) { resource = Elmas::CommercialBuildingValue.new(id: "12abcdef-1234-1234-1234-123456abcdef", asset: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("assets/CommercialBuildingValues(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("assets/CommercialBuildingValues?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("assets/CommercialBuildingValues?$filter=Asset eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:asset, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("assets/CommercialBuildingValues?$orderby=Asset&$filter=Asset eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:asset, :id], order_by: :asset)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("assets/CommercialBuildingValues?$orderby=Asset")
      resource.find_all(order_by: :asset)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("assets/CommercialBuildingValues?$select=Asset")
      resource.find_all(select: [:asset])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("assets/CommercialBuildingValues?$select=Asset")
      resource.find_by(select: [:asset])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("assets/CommercialBuildingValues?$select=Asset,ID")
      resource.find_all(select: [:asset, :id])
    end
  end
end
