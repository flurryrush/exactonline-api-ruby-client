require 'spec_helper'

describe Elmas::SyncManufacturingShopOrderRoutingStepPlan do
  it "can initialize" do
    sync_manufacturing_shop_order_routing_step_plan = Elmas::SyncManufacturingShopOrderRoutingStepPlan.new
    expect(sync_manufacturing_shop_order_routing_step_plan).to be_a(Elmas::SyncManufacturingShopOrderRoutingStepPlan)
  end

  it "accepts attribute setter" do
    sync_manufacturing_shop_order_routing_step_plan = Elmas::SyncManufacturingShopOrderRoutingStepPlan.new
    sync_manufacturing_shop_order_routing_step_plan.account_number = "78238"
    expect(sync_manufacturing_shop_order_routing_step_plan.account_number).to eq "78238"
  end

  it "returns value for getters" do
    sync_manufacturing_shop_order_routing_step_plan = Elmas::SyncManufacturingShopOrderRoutingStepPlan.new({ "AccountNumber" => "345" })
    expect(sync_manufacturing_shop_order_routing_step_plan.account_number).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_manufacturing_shop_order_routing_step_plan = Elmas::SyncManufacturingShopOrderRoutingStepPlan.new({ this_does_not_exist: "Piet" })
    expect(sync_manufacturing_shop_order_routing_step_plan.try(:account_number)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncManufacturingShopOrderRoutingStepPlan.new(id: "12abcdef-1234-1234-1234-123456abcdef", account_number: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderRoutingStepPlans(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderRoutingStepPlans?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderRoutingStepPlans?$filter=AccountNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_number, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderRoutingStepPlans?$orderby=AccountNumber&$filter=AccountNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_number, :id], order_by: :account_number)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderRoutingStepPlans?$orderby=AccountNumber")
      resource.find_all(order_by: :account_number)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderRoutingStepPlans?$select=AccountNumber")
      resource.find_all(select: [:account_number])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderRoutingStepPlans?$select=AccountNumber")
      resource.find_by(select: [:account_number])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/ShopOrderRoutingStepPlans?$select=AccountNumber,ID")
      resource.find_all(select: [:account_number, :id])
    end
  end
end
