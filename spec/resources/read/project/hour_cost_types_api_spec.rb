require 'spec_helper'

describe Elmas::HourCostType do
  it "can initialize" do
    hour_cost_type = Elmas::HourCostType.new
    expect(hour_cost_type).to be_a(Elmas::HourCostType)
  end

  it "accepts attribute setter" do
    hour_cost_type = Elmas::HourCostType.new
    hour_cost_type.item_description = "78238"
    expect(hour_cost_type.item_description).to eq "78238"
  end

  it "returns value for getters" do
    hour_cost_type = Elmas::HourCostType.new({ "ItemDescription" => "345" })
    expect(hour_cost_type.item_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    hour_cost_type = Elmas::HourCostType.new({ this_does_not_exist: "Piet" })
    expect(hour_cost_type.try(:item_description)).to eq nil
  end



  let(:resource) { resource = Elmas::HourCostType.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/HourCostTypes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/HourCostTypes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/HourCostTypes?$filter=ItemDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/HourCostTypes?$orderby=ItemDescription&$filter=ItemDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_description, :id], order_by: :item_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/HourCostTypes?$orderby=ItemDescription")
      resource.find_all(order_by: :item_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HourCostTypes?$select=ItemDescription")
      resource.find_all(select: [:item_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/HourCostTypes?$select=ItemDescription")
      resource.find_by(select: [:item_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HourCostTypes?$select=ItemDescription,ID")
      resource.find_all(select: [:item_description, :id])
    end
  end
end
