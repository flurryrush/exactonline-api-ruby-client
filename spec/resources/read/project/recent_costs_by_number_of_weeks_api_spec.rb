require 'spec_helper'

describe Elmas::RecentCostsByNumberOfWeek do
  it "can initialize" do
    recent_costs_by_number_of_week = Elmas::RecentCostsByNumberOfWeek.new
    expect(recent_costs_by_number_of_week).to be_a(Elmas::RecentCostsByNumberOfWeek)
  end

  it "accepts attribute setter" do
    recent_costs_by_number_of_week = Elmas::RecentCostsByNumberOfWeek.new
    recent_costs_by_number_of_week.account_id = "78238"
    expect(recent_costs_by_number_of_week.account_id).to eq "78238"
  end

  it "returns value for getters" do
    recent_costs_by_number_of_week = Elmas::RecentCostsByNumberOfWeek.new({ "AccountID" => "345" })
    expect(recent_costs_by_number_of_week.account_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    recent_costs_by_number_of_week = Elmas::RecentCostsByNumberOfWeek.new({ this_does_not_exist: "Piet" })
    expect(recent_costs_by_number_of_week.try(:account_id)).to eq nil
  end



  let(:resource) { resource = Elmas::RecentCostsByNumberOfWeek.new(id: "12abcdef-1234-1234-1234-123456abcdef", account_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/RecentCostsByNumberOfWeeks(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/RecentCostsByNumberOfWeeks?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/RecentCostsByNumberOfWeeks?$filter=AccountID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/RecentCostsByNumberOfWeeks?$orderby=AccountID&$filter=AccountID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_id, :id], order_by: :account_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/RecentCostsByNumberOfWeeks?$orderby=AccountID")
      resource.find_all(order_by: :account_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/RecentCostsByNumberOfWeeks?$select=AccountID")
      resource.find_all(select: [:account_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/RecentCostsByNumberOfWeeks?$select=AccountID")
      resource.find_by(select: [:account_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/RecentCostsByNumberOfWeeks?$select=AccountID,ID")
      resource.find_all(select: [:account_id, :id])
    end
  end
end
