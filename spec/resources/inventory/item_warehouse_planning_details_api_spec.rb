require 'spec_helper'

describe Elmas::ItemWarehousePlanningDetail do
  it "can initialize" do
    item_warehouse_planning_detail = Elmas::ItemWarehousePlanningDetail.new
    expect(item_warehouse_planning_detail).to be_a(Elmas::ItemWarehousePlanningDetail)
  end

  it "accepts attribute setter" do
    item_warehouse_planning_detail = Elmas::ItemWarehousePlanningDetail.new
    item_warehouse_planning_detail.planning_source_url = "78238"
    expect(item_warehouse_planning_detail.planning_source_url).to eq "78238"
  end

  it "returns value for getters" do
    item_warehouse_planning_detail = Elmas::ItemWarehousePlanningDetail.new({ "PlanningSourceUrl" => "345" })
    expect(item_warehouse_planning_detail.planning_source_url).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    item_warehouse_planning_detail = Elmas::ItemWarehousePlanningDetail.new({ this_does_not_exist: "Piet" })
    expect(item_warehouse_planning_detail.try(:planning_source_url)).to eq nil
  end



  let(:resource) { resource = Elmas::ItemWarehousePlanningDetail.new(id: "12abcdef-1234-1234-1234-123456abcdef", planning_source_url: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehousePlanningDetails(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehousePlanningDetails?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehousePlanningDetails?$filter=PlanningSourceUrl eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:planning_source_url, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehousePlanningDetails?$orderby=PlanningSourceUrl&$filter=PlanningSourceUrl eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:planning_source_url, :id], order_by: :planning_source_url)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/ItemWarehousePlanningDetails?$orderby=PlanningSourceUrl")
      resource.find_all(order_by: :planning_source_url)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehousePlanningDetails?$select=PlanningSourceUrl")
      resource.find_all(select: [:planning_source_url])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehousePlanningDetails?$select=PlanningSourceUrl")
      resource.find_by(select: [:planning_source_url])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/ItemWarehousePlanningDetails?$select=PlanningSourceUrl,ID")
      resource.find_all(select: [:planning_source_url, :id])
    end
  end
end
