require 'spec_helper'

describe Elmas::CostTypesByDate do
  it "can initialize" do
    cost_types_by_date = Elmas::CostTypesByDate.new
    expect(cost_types_by_date).to be_a(Elmas::CostTypesByDate)
  end

  it "accepts attribute setter" do
    cost_types_by_date = Elmas::CostTypesByDate.new
    cost_types_by_date.item_code = "78238"
    expect(cost_types_by_date.item_code).to eq "78238"
  end

  it "returns value for getters" do
    cost_types_by_date = Elmas::CostTypesByDate.new({ "ItemCode" => "345" })
    expect(cost_types_by_date.item_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    cost_types_by_date = Elmas::CostTypesByDate.new({ this_does_not_exist: "Piet" })
    expect(cost_types_by_date.try(:item_code)).to eq nil
  end



  let(:resource) { resource = Elmas::CostTypesByDate.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/CostTypesByDate(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/CostTypesByDate?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/CostTypesByDate?$filter=ItemCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/CostTypesByDate?$orderby=ItemCode&$filter=ItemCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_code, :id], order_by: :item_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/CostTypesByDate?$orderby=ItemCode")
      resource.find_all(order_by: :item_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/CostTypesByDate?$select=ItemCode")
      resource.find_all(select: [:item_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/CostTypesByDate?$select=ItemCode")
      resource.find_by(select: [:item_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/CostTypesByDate?$select=ItemCode,ID")
      resource.find_all(select: [:item_code, :id])
    end
  end
end
