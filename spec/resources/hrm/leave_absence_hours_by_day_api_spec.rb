require 'spec_helper'

describe Elmas::LeaveAbsenceHoursByDay do
  it "can initialize" do
    leave_absence_hours_by_day = Elmas::LeaveAbsenceHoursByDay.new
    expect(leave_absence_hours_by_day).to be_a(Elmas::LeaveAbsenceHoursByDay)
  end

  it "accepts attribute setter" do
    leave_absence_hours_by_day = Elmas::LeaveAbsenceHoursByDay.new
    leave_absence_hours_by_day.start_time = "78238"
    expect(leave_absence_hours_by_day.start_time).to eq "78238"
  end

  it "returns value for getters" do
    leave_absence_hours_by_day = Elmas::LeaveAbsenceHoursByDay.new({ "StartTime" => "345" })
    expect(leave_absence_hours_by_day.start_time).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    leave_absence_hours_by_day = Elmas::LeaveAbsenceHoursByDay.new({ this_does_not_exist: "Piet" })
    expect(leave_absence_hours_by_day.try(:start_time)).to eq nil
  end

  it "is valid with mandatory attributes" do
    leave_absence_hours_by_day = Elmas::LeaveAbsenceHoursByDay.new(date: "Date", employee: "Employee", hours: "Hours", status: "Status", type: "Type")
    expect(leave_absence_hours_by_day.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    leave_absence_hours_by_day = Elmas::LeaveAbsenceHoursByDay.new
    expect(leave_absence_hours_by_day.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::LeaveAbsenceHoursByDay.new(id: "12abcdef-1234-1234-1234-123456abcdef", start_time: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("hrm/LeaveAbsenceHoursByDay(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("hrm/LeaveAbsenceHoursByDay?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("hrm/LeaveAbsenceHoursByDay?$filter=StartTime eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:start_time, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("hrm/LeaveAbsenceHoursByDay?$orderby=StartTime&$filter=StartTime eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:start_time, :id], order_by: :start_time)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("hrm/LeaveAbsenceHoursByDay?$orderby=StartTime")
      resource.find_all(order_by: :start_time)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/LeaveAbsenceHoursByDay?$select=StartTime")
      resource.find_all(select: [:start_time])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("hrm/LeaveAbsenceHoursByDay?$select=StartTime")
      resource.find_by(select: [:start_time])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/LeaveAbsenceHoursByDay?$select=StartTime,ID")
      resource.find_all(select: [:start_time, :id])
    end
  end
end
