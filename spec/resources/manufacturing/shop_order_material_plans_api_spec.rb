require 'spec_helper'

describe Elmas::ShopOrderMaterialPlan do
  it "can initialize" do
    shop_order_material_plan = Elmas::ShopOrderMaterialPlan.new
    expect(shop_order_material_plan).to be_a(Elmas::ShopOrderMaterialPlan)
  end

  it "accepts attribute setter" do
    shop_order_material_plan = Elmas::ShopOrderMaterialPlan.new
    shop_order_material_plan.creator = "78238"
    expect(shop_order_material_plan.creator).to eq "78238"
  end

  it "returns value for getters" do
    shop_order_material_plan = Elmas::ShopOrderMaterialPlan.new({ "Creator" => "345" })
    expect(shop_order_material_plan.creator).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    shop_order_material_plan = Elmas::ShopOrderMaterialPlan.new({ this_does_not_exist: "Piet" })
    expect(shop_order_material_plan.try(:creator)).to eq nil
  end

  it "is valid with mandatory attributes" do
    shop_order_material_plan = Elmas::ShopOrderMaterialPlan.new(item: "Item", shop_order: "ShopOrder")
    expect(shop_order_material_plan.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    shop_order_material_plan = Elmas::ShopOrderMaterialPlan.new
    expect(shop_order_material_plan.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ShopOrderMaterialPlan.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlans(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlans?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlans?$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlans?$orderby=Creator&$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id], order_by: :creator)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlans?$orderby=Creator")
      resource.find_all(order_by: :creator)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlans?$select=Creator")
      resource.find_all(select: [:creator])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlans?$select=Creator")
      resource.find_by(select: [:creator])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlans?$select=Creator,ID")
      resource.find_all(select: [:creator, :id])
    end
  end
end
