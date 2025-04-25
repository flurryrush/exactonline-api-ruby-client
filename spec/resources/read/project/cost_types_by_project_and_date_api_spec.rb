require 'spec_helper'

describe Elmas::CostTypesByProjectAndDate do
  it "can initialize" do
    cost_types_by_project_and_date = Elmas::CostTypesByProjectAndDate.new
    expect(cost_types_by_project_and_date).to be_a(Elmas::CostTypesByProjectAndDate)
  end

  it "accepts attribute setter" do
    cost_types_by_project_and_date = Elmas::CostTypesByProjectAndDate.new
    cost_types_by_project_and_date.item_id = "78238"
    expect(cost_types_by_project_and_date.item_id).to eq "78238"
  end

  it "returns value for getters" do
    cost_types_by_project_and_date = Elmas::CostTypesByProjectAndDate.new({ "ItemID" => "345" })
    expect(cost_types_by_project_and_date.item_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    cost_types_by_project_and_date = Elmas::CostTypesByProjectAndDate.new({ this_does_not_exist: "Piet" })
    expect(cost_types_by_project_and_date.try(:item_id)).to eq nil
  end



  let(:resource) { resource = Elmas::CostTypesByProjectAndDate.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/CostTypesByProjectAndDate(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/CostTypesByProjectAndDate?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/CostTypesByProjectAndDate?$filter=ItemID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/CostTypesByProjectAndDate?$orderby=ItemID&$filter=ItemID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_id, :id], order_by: :item_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/CostTypesByProjectAndDate?$orderby=ItemID")
      resource.find_all(order_by: :item_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/CostTypesByProjectAndDate?$select=ItemID")
      resource.find_all(select: [:item_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/CostTypesByProjectAndDate?$select=ItemID")
      resource.find_by(select: [:item_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/CostTypesByProjectAndDate?$select=ItemID,ID")
      resource.find_all(select: [:item_id, :id])
    end
  end
end
