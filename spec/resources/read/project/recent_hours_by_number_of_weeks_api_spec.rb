require 'spec_helper'

describe Elmas::RecentHoursByNumberOfWeek do
  it "can initialize" do
    recent_hours_by_number_of_week = Elmas::RecentHoursByNumberOfWeek.new
    expect(recent_hours_by_number_of_week).to be_a(Elmas::RecentHoursByNumberOfWeek)
  end

  it "accepts attribute setter" do
    recent_hours_by_number_of_week = Elmas::RecentHoursByNumberOfWeek.new
    recent_hours_by_number_of_week.hours_approved_billable = "78238"
    expect(recent_hours_by_number_of_week.hours_approved_billable).to eq "78238"
  end

  it "returns value for getters" do
    recent_hours_by_number_of_week = Elmas::RecentHoursByNumberOfWeek.new({ "HoursApprovedBillable" => "345" })
    expect(recent_hours_by_number_of_week.hours_approved_billable).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    recent_hours_by_number_of_week = Elmas::RecentHoursByNumberOfWeek.new({ this_does_not_exist: "Piet" })
    expect(recent_hours_by_number_of_week.try(:hours_approved_billable)).to eq nil
  end



  let(:resource) { resource = Elmas::RecentHoursByNumberOfWeek.new(id: "12abcdef-1234-1234-1234-123456abcdef", hours_approved_billable: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeks(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeks?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeks?$filter=HoursApprovedBillable eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:hours_approved_billable, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeks?$orderby=HoursApprovedBillable&$filter=HoursApprovedBillable eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:hours_approved_billable, :id], order_by: :hours_approved_billable)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeks?$orderby=HoursApprovedBillable")
      resource.find_all(order_by: :hours_approved_billable)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeks?$select=HoursApprovedBillable")
      resource.find_all(select: [:hours_approved_billable])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeks?$select=HoursApprovedBillable")
      resource.find_by(select: [:hours_approved_billable])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeks?$select=HoursApprovedBillable,ID")
      resource.find_all(select: [:hours_approved_billable, :id])
    end
  end
end
