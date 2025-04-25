require 'spec_helper'

describe Elmas::RecentCost do
  it "can initialize" do
    recent_cost = Elmas::RecentCost.new
    expect(recent_cost).to be_a(Elmas::RecentCost)
  end

  it "accepts attribute setter" do
    recent_cost = Elmas::RecentCost.new
    recent_cost.week_number = "78238"
    expect(recent_cost.week_number).to eq "78238"
  end

  it "returns value for getters" do
    recent_cost = Elmas::RecentCost.new({ "WeekNumber" => "345" })
    expect(recent_cost.week_number).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    recent_cost = Elmas::RecentCost.new({ this_does_not_exist: "Piet" })
    expect(recent_cost.try(:week_number)).to eq nil
  end



  let(:resource) { resource = Elmas::RecentCost.new(id: "12abcdef-1234-1234-1234-123456abcdef", week_number: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/RecentCosts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/RecentCosts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/RecentCosts?$filter=WeekNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:week_number, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/RecentCosts?$orderby=WeekNumber&$filter=WeekNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:week_number, :id], order_by: :week_number)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/RecentCosts?$orderby=WeekNumber")
      resource.find_all(order_by: :week_number)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/RecentCosts?$select=WeekNumber")
      resource.find_all(select: [:week_number])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/RecentCosts?$select=WeekNumber")
      resource.find_by(select: [:week_number])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/RecentCosts?$select=WeekNumber,ID")
      resource.find_all(select: [:week_number, :id])
    end
  end
end
