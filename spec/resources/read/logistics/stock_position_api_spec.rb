require 'spec_helper'

describe Elmas::StockPosition do
  it "can initialize" do
    stock_position = Elmas::StockPosition.new
    expect(stock_position).to be_a(Elmas::StockPosition)
  end

  it "accepts attribute setter" do
    stock_position = Elmas::StockPosition.new
    stock_position.planning_out = "78238"
    expect(stock_position.planning_out).to eq "78238"
  end

  it "returns value for getters" do
    stock_position = Elmas::StockPosition.new({ "PlanningOut" => "345" })
    expect(stock_position.planning_out).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    stock_position = Elmas::StockPosition.new({ this_does_not_exist: "Piet" })
    expect(stock_position.try(:planning_out)).to eq nil
  end



  let(:resource) { resource = Elmas::StockPosition.new(id: "12abcdef-1234-1234-1234-123456abcdef", planning_out: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/logistics/StockPosition(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/logistics/StockPosition?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/logistics/StockPosition?$filter=PlanningOut eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:planning_out, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/logistics/StockPosition?$orderby=PlanningOut&$filter=PlanningOut eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:planning_out, :id], order_by: :planning_out)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/logistics/StockPosition?$orderby=PlanningOut")
      resource.find_all(order_by: :planning_out)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/logistics/StockPosition?$select=PlanningOut")
      resource.find_all(select: [:planning_out])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/logistics/StockPosition?$select=PlanningOut")
      resource.find_by(select: [:planning_out])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/logistics/StockPosition?$select=PlanningOut,ID")
      resource.find_all(select: [:planning_out, :id])
    end
  end
end
