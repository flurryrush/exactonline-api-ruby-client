require 'spec_helper'

describe Elmas::Schedule do
  it "can initialize" do
    schedule = Elmas::Schedule.new
    expect(schedule).to be_a(Elmas::Schedule)
  end

  it "accepts attribute setter" do
    schedule = Elmas::Schedule.new
    schedule.creator = "78238"
    expect(schedule.creator).to eq "78238"
  end

  it "returns value for getters" do
    schedule = Elmas::Schedule.new({ "Creator" => "345" })
    expect(schedule.creator).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    schedule = Elmas::Schedule.new({ this_does_not_exist: "Piet" })
    expect(schedule.try(:creator)).to eq nil
  end

  it "is valid with mandatory attributes" do
    schedule = Elmas::Schedule.new(average_hours: "AverageHours", employment: "Employment", schedule_type: "ScheduleType", start_date: "StartDate")
    expect(schedule.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    schedule = Elmas::Schedule.new
    expect(schedule.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::Schedule.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("hrm/Schedules(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("hrm/Schedules?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("hrm/Schedules?$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("hrm/Schedules?$orderby=Creator&$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id], order_by: :creator)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("hrm/Schedules?$orderby=Creator")
      resource.find_all(order_by: :creator)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/Schedules?$select=Creator")
      resource.find_all(select: [:creator])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("hrm/Schedules?$select=Creator")
      resource.find_by(select: [:creator])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/Schedules?$select=Creator,ID")
      resource.find_all(select: [:creator, :id])
    end
  end
end
