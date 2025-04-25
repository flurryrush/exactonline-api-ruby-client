require 'spec_helper'

describe Elmas::RecentHoursByNumberOfWeeksByDate do
  it "can initialize" do
    recent_hours_by_number_of_weeks_by_date = Elmas::RecentHoursByNumberOfWeeksByDate.new
    expect(recent_hours_by_number_of_weeks_by_date).to be_a(Elmas::RecentHoursByNumberOfWeeksByDate)
  end

  it "accepts attribute setter" do
    recent_hours_by_number_of_weeks_by_date = Elmas::RecentHoursByNumberOfWeeksByDate.new
    recent_hours_by_number_of_weeks_by_date.activity = "78238"
    expect(recent_hours_by_number_of_weeks_by_date.activity).to eq "78238"
  end

  it "returns value for getters" do
    recent_hours_by_number_of_weeks_by_date = Elmas::RecentHoursByNumberOfWeeksByDate.new({ "Activity" => "345" })
    expect(recent_hours_by_number_of_weeks_by_date.activity).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    recent_hours_by_number_of_weeks_by_date = Elmas::RecentHoursByNumberOfWeeksByDate.new({ this_does_not_exist: "Piet" })
    expect(recent_hours_by_number_of_weeks_by_date.try(:activity)).to eq nil
  end



  let(:resource) { resource = Elmas::RecentHoursByNumberOfWeeksByDate.new(id: "12abcdef-1234-1234-1234-123456abcdef", activity: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeksByDate(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeksByDate?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeksByDate?$filter=Activity eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:activity, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeksByDate?$orderby=Activity&$filter=Activity eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:activity, :id], order_by: :activity)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeksByDate?$orderby=Activity")
      resource.find_all(order_by: :activity)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeksByDate?$select=Activity")
      resource.find_all(select: [:activity])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeksByDate?$select=Activity")
      resource.find_by(select: [:activity])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/RecentHoursByNumberOfWeeksByDate?$select=Activity,ID")
      resource.find_all(select: [:activity, :id])
    end
  end
end
