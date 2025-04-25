require 'spec_helper'

describe Elmas::ShopOrderRoutingStepPlansAvailableToWork do
  it "can initialize" do
    shop_order_routing_step_plans_available_to_work = Elmas::ShopOrderRoutingStepPlansAvailableToWork.new
    expect(shop_order_routing_step_plans_available_to_work).to be_a(Elmas::ShopOrderRoutingStepPlansAvailableToWork)
  end

  it "accepts attribute setter" do
    shop_order_routing_step_plans_available_to_work = Elmas::ShopOrderRoutingStepPlansAvailableToWork.new
    shop_order_routing_step_plans_available_to_work.sales_order_count = "78238"
    expect(shop_order_routing_step_plans_available_to_work.sales_order_count).to eq "78238"
  end

  it "returns value for getters" do
    shop_order_routing_step_plans_available_to_work = Elmas::ShopOrderRoutingStepPlansAvailableToWork.new({ "SalesOrderCount" => "345" })
    expect(shop_order_routing_step_plans_available_to_work.sales_order_count).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    shop_order_routing_step_plans_available_to_work = Elmas::ShopOrderRoutingStepPlansAvailableToWork.new({ this_does_not_exist: "Piet" })
    expect(shop_order_routing_step_plans_available_to_work.try(:sales_order_count)).to eq nil
  end



  let(:resource) { resource = Elmas::ShopOrderRoutingStepPlansAvailableToWork.new(id: "12abcdef-1234-1234-1234-123456abcdef", sales_order_count: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/manufacturing/ShopOrderRoutingStepPlansAvailableToWork(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/manufacturing/ShopOrderRoutingStepPlansAvailableToWork?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/manufacturing/ShopOrderRoutingStepPlansAvailableToWork?$filter=SalesOrderCount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:sales_order_count, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/manufacturing/ShopOrderRoutingStepPlansAvailableToWork?$orderby=SalesOrderCount&$filter=SalesOrderCount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:sales_order_count, :id], order_by: :sales_order_count)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/manufacturing/ShopOrderRoutingStepPlansAvailableToWork?$orderby=SalesOrderCount")
      resource.find_all(order_by: :sales_order_count)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/manufacturing/ShopOrderRoutingStepPlansAvailableToWork?$select=SalesOrderCount")
      resource.find_all(select: [:sales_order_count])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/manufacturing/ShopOrderRoutingStepPlansAvailableToWork?$select=SalesOrderCount")
      resource.find_by(select: [:sales_order_count])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/manufacturing/ShopOrderRoutingStepPlansAvailableToWork?$select=SalesOrderCount,ID")
      resource.find_all(select: [:sales_order_count, :id])
    end
  end
end
