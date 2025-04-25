require 'spec_helper'

describe Elmas::SyncHRMSchedule do
  it "can initialize" do
    sync_hrm_schedule = Elmas::SyncHRMSchedule.new
    expect(sync_hrm_schedule).to be_a(Elmas::SyncHRMSchedule)
  end

  it "accepts attribute setter" do
    sync_hrm_schedule = Elmas::SyncHRMSchedule.new
    sync_hrm_schedule.code = "78238"
    expect(sync_hrm_schedule.code).to eq "78238"
  end

  it "returns value for getters" do
    sync_hrm_schedule = Elmas::SyncHRMSchedule.new({ "Code" => "345" })
    expect(sync_hrm_schedule.code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_hrm_schedule = Elmas::SyncHRMSchedule.new({ this_does_not_exist: "Piet" })
    expect(sync_hrm_schedule.try(:code)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_hrm_schedule = Elmas::SyncHRMSchedule.new(average_hours: "AverageHours", employment: "Employment", schedule_type: "ScheduleType", start_date: "StartDate")
    expect(sync_hrm_schedule.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_hrm_schedule = Elmas::SyncHRMSchedule.new
    expect(sync_hrm_schedule.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncHRMSchedule.new(id: "12abcdef-1234-1234-1234-123456abcdef", code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/HRM/Schedules(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/HRM/Schedules?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/HRM/Schedules?$filter=Code eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/HRM/Schedules?$orderby=Code&$filter=Code eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:code, :id], order_by: :code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/HRM/Schedules?$orderby=Code")
      resource.find_all(order_by: :code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/HRM/Schedules?$select=Code")
      resource.find_all(select: [:code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/HRM/Schedules?$select=Code")
      resource.find_by(select: [:code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/HRM/Schedules?$select=Code,ID")
      resource.find_all(select: [:code, :id])
    end
  end
end
