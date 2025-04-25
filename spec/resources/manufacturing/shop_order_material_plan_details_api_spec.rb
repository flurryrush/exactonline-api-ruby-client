require 'spec_helper'

describe Elmas::ShopOrderMaterialPlanDetail do
  it "can initialize" do
    shop_order_material_plan_detail = Elmas::ShopOrderMaterialPlanDetail.new
    expect(shop_order_material_plan_detail).to be_a(Elmas::ShopOrderMaterialPlanDetail)
  end

  it "accepts attribute setter" do
    shop_order_material_plan_detail = Elmas::ShopOrderMaterialPlanDetail.new
    shop_order_material_plan_detail.unit = "78238"
    expect(shop_order_material_plan_detail.unit).to eq "78238"
  end

  it "returns value for getters" do
    shop_order_material_plan_detail = Elmas::ShopOrderMaterialPlanDetail.new({ "Unit" => "345" })
    expect(shop_order_material_plan_detail.unit).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    shop_order_material_plan_detail = Elmas::ShopOrderMaterialPlanDetail.new({ this_does_not_exist: "Piet" })
    expect(shop_order_material_plan_detail.try(:unit)).to eq nil
  end

  it "is valid with mandatory attributes" do
    shop_order_material_plan_detail = Elmas::ShopOrderMaterialPlanDetail.new(item: "Item", shop_order: "ShopOrder")
    expect(shop_order_material_plan_detail.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    shop_order_material_plan_detail = Elmas::ShopOrderMaterialPlanDetail.new
    expect(shop_order_material_plan_detail.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ShopOrderMaterialPlanDetail.new(id: "12abcdef-1234-1234-1234-123456abcdef", unit: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlanDetails(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlanDetails?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlanDetails?$filter=Unit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:unit, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlanDetails?$orderby=Unit&$filter=Unit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:unit, :id], order_by: :unit)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlanDetails?$orderby=Unit")
      resource.find_all(order_by: :unit)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlanDetails?$select=Unit")
      resource.find_all(select: [:unit])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlanDetails?$select=Unit")
      resource.find_by(select: [:unit])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderMaterialPlanDetails?$select=Unit,ID")
      resource.find_all(select: [:unit, :id])
    end
  end
end
