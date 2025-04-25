require 'spec_helper'

describe Elmas::SyncHRMLeaveAbsenceHoursByDay do
  it "can initialize" do
    sync_hrm_leave_absence_hours_by_day = Elmas::SyncHRMLeaveAbsenceHoursByDay.new
    expect(sync_hrm_leave_absence_hours_by_day).to be_a(Elmas::SyncHRMLeaveAbsenceHoursByDay)
  end

  it "accepts attribute setter" do
    sync_hrm_leave_absence_hours_by_day = Elmas::SyncHRMLeaveAbsenceHoursByDay.new
    sync_hrm_leave_absence_hours_by_day.end_time = "78238"
    expect(sync_hrm_leave_absence_hours_by_day.end_time).to eq "78238"
  end

  it "returns value for getters" do
    sync_hrm_leave_absence_hours_by_day = Elmas::SyncHRMLeaveAbsenceHoursByDay.new({ "EndTime" => "345" })
    expect(sync_hrm_leave_absence_hours_by_day.end_time).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_hrm_leave_absence_hours_by_day = Elmas::SyncHRMLeaveAbsenceHoursByDay.new({ this_does_not_exist: "Piet" })
    expect(sync_hrm_leave_absence_hours_by_day.try(:end_time)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_hrm_leave_absence_hours_by_day = Elmas::SyncHRMLeaveAbsenceHoursByDay.new(date: "Date", employee: "Employee", hours: "Hours", status: "Status", type: "Type")
    expect(sync_hrm_leave_absence_hours_by_day.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_hrm_leave_absence_hours_by_day = Elmas::SyncHRMLeaveAbsenceHoursByDay.new
    expect(sync_hrm_leave_absence_hours_by_day.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncHRMLeaveAbsenceHoursByDay.new(id: "12abcdef-1234-1234-1234-123456abcdef", end_time: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/HRM/LeaveAbsenceHoursByDay(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/HRM/LeaveAbsenceHoursByDay?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/HRM/LeaveAbsenceHoursByDay?$filter=EndTime eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:end_time, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/HRM/LeaveAbsenceHoursByDay?$orderby=EndTime&$filter=EndTime eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:end_time, :id], order_by: :end_time)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/HRM/LeaveAbsenceHoursByDay?$orderby=EndTime")
      resource.find_all(order_by: :end_time)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/HRM/LeaveAbsenceHoursByDay?$select=EndTime")
      resource.find_all(select: [:end_time])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/HRM/LeaveAbsenceHoursByDay?$select=EndTime")
      resource.find_by(select: [:end_time])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/HRM/LeaveAbsenceHoursByDay?$select=EndTime,ID")
      resource.find_all(select: [:end_time, :id])
    end
  end
end
