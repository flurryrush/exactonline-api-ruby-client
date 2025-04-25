require 'spec_helper'

describe Elmas::ShopOrder do
  it "can initialize" do
    shop_order = Elmas::ShopOrder.new
    expect(shop_order).to be_a(Elmas::ShopOrder)
  end

  it "accepts attribute setter" do
    shop_order = Elmas::ShopOrder.new
    shop_order.project_description = "78238"
    expect(shop_order.project_description).to eq "78238"
  end

  it "returns value for getters" do
    shop_order = Elmas::ShopOrder.new({ "ProjectDescription" => "345" })
    expect(shop_order.project_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    shop_order = Elmas::ShopOrder.new({ this_does_not_exist: "Piet" })
    expect(shop_order.try(:project_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    shop_order = Elmas::ShopOrder.new(item: "Item", planned_quantity: "PlannedQuantity")
    expect(shop_order.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    shop_order = Elmas::ShopOrder.new
    expect(shop_order.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ShopOrder.new(id: "12abcdef-1234-1234-1234-123456abcdef", project_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrders?$filter=ProjectDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrders?$orderby=ProjectDescription&$filter=ProjectDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_description, :id], order_by: :project_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrders?$orderby=ProjectDescription")
      resource.find_all(order_by: :project_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrders?$select=ProjectDescription")
      resource.find_all(select: [:project_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrders?$select=ProjectDescription")
      resource.find_by(select: [:project_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrders?$select=ProjectDescription,ID")
      resource.find_all(select: [:project_description, :id])
    end
  end
end
