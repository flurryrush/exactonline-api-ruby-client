require 'spec_helper'

describe Elmas::ShopOrderRoutingStepPlan do
  it "can initialize" do
    shop_order_routing_step_plan = Elmas::ShopOrderRoutingStepPlan.new
    expect(shop_order_routing_step_plan).to be_a(Elmas::ShopOrderRoutingStepPlan)
  end

  it "accepts attribute setter" do
    shop_order_routing_step_plan = Elmas::ShopOrderRoutingStepPlan.new
    shop_order_routing_step_plan.workcenter = "78238"
    expect(shop_order_routing_step_plan.workcenter).to eq "78238"
  end

  it "returns value for getters" do
    shop_order_routing_step_plan = Elmas::ShopOrderRoutingStepPlan.new({ "Workcenter" => "345" })
    expect(shop_order_routing_step_plan.workcenter).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    shop_order_routing_step_plan = Elmas::ShopOrderRoutingStepPlan.new({ this_does_not_exist: "Piet" })
    expect(shop_order_routing_step_plan.try(:workcenter)).to eq nil
  end

  it "is valid with mandatory attributes" do
    shop_order_routing_step_plan = Elmas::ShopOrderRoutingStepPlan.new(operation: "Operation", shop_order: "ShopOrder")
    expect(shop_order_routing_step_plan.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    shop_order_routing_step_plan = Elmas::ShopOrderRoutingStepPlan.new
    expect(shop_order_routing_step_plan.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ShopOrderRoutingStepPlan.new(id: "12abcdef-1234-1234-1234-123456abcdef", workcenter: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderRoutingStepPlans(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderRoutingStepPlans?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderRoutingStepPlans?$filter=Workcenter eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:workcenter, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderRoutingStepPlans?$orderby=Workcenter&$filter=Workcenter eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:workcenter, :id], order_by: :workcenter)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderRoutingStepPlans?$orderby=Workcenter")
      resource.find_all(order_by: :workcenter)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderRoutingStepPlans?$select=Workcenter")
      resource.find_all(select: [:workcenter])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderRoutingStepPlans?$select=Workcenter")
      resource.find_by(select: [:workcenter])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderRoutingStepPlans?$select=Workcenter,ID")
      resource.find_all(select: [:workcenter, :id])
    end
  end
end
