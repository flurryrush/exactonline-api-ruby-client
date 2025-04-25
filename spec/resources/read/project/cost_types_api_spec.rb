require 'spec_helper'

describe Elmas::CostType do
  it "can initialize" do
    cost_type = Elmas::CostType.new
    expect(cost_type).to be_a(Elmas::CostType)
  end

  it "accepts attribute setter" do
    cost_type = Elmas::CostType.new
    cost_type.item_description = "78238"
    expect(cost_type.item_description).to eq "78238"
  end

  it "returns value for getters" do
    cost_type = Elmas::CostType.new({ "ItemDescription" => "345" })
    expect(cost_type.item_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    cost_type = Elmas::CostType.new({ this_does_not_exist: "Piet" })
    expect(cost_type.try(:item_description)).to eq nil
  end



  let(:resource) { resource = Elmas::CostType.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/CostTypes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/CostTypes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/CostTypes?$filter=ItemDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/CostTypes?$orderby=ItemDescription&$filter=ItemDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_description, :id], order_by: :item_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/CostTypes?$orderby=ItemDescription")
      resource.find_all(order_by: :item_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/CostTypes?$select=ItemDescription")
      resource.find_all(select: [:item_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/CostTypes?$select=ItemDescription")
      resource.find_by(select: [:item_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/CostTypes?$select=ItemDescription,ID")
      resource.find_all(select: [:item_description, :id])
    end
  end
end
