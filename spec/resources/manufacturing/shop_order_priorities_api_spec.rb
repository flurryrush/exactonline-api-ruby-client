require 'spec_helper'

describe Elmas::ShopOrderPriority do
  it "can initialize" do
    shop_order_priority = Elmas::ShopOrderPriority.new
    expect(shop_order_priority).to be_a(Elmas::ShopOrderPriority)
  end

  it "accepts attribute setter" do
    shop_order_priority = Elmas::ShopOrderPriority.new
    shop_order_priority.division = "78238"
    expect(shop_order_priority.division).to eq "78238"
  end

  it "returns value for getters" do
    shop_order_priority = Elmas::ShopOrderPriority.new({ "Division" => "345" })
    expect(shop_order_priority.division).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    shop_order_priority = Elmas::ShopOrderPriority.new({ this_does_not_exist: "Piet" })
    expect(shop_order_priority.try(:division)).to eq nil
  end

  it "is valid with mandatory attributes" do
    shop_order_priority = Elmas::ShopOrderPriority.new(mode: "Mode")
    expect(shop_order_priority.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    shop_order_priority = Elmas::ShopOrderPriority.new
    expect(shop_order_priority.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ShopOrderPriority.new(id: "12abcdef-1234-1234-1234-123456abcdef", division: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderPriorities(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderPriorities?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderPriorities?$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderPriorities?$orderby=Division&$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id], order_by: :division)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderPriorities?$orderby=Division")
      resource.find_all(order_by: :division)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderPriorities?$select=Division")
      resource.find_all(select: [:division])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderPriorities?$select=Division")
      resource.find_by(select: [:division])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderPriorities?$select=Division,ID")
      resource.find_all(select: [:division, :id])
    end
  end
end
