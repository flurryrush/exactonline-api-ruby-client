require 'spec_helper'

describe Elmas::ProjectPlanningRecurring do
  it "can initialize" do
    project_planning_recurring = Elmas::ProjectPlanningRecurring.new
    expect(project_planning_recurring).to be_a(Elmas::ProjectPlanningRecurring)
  end

  it "accepts attribute setter" do
    project_planning_recurring = Elmas::ProjectPlanningRecurring.new
    project_planning_recurring.number_of_recurrences = "78238"
    expect(project_planning_recurring.number_of_recurrences).to eq "78238"
  end

  it "returns value for getters" do
    project_planning_recurring = Elmas::ProjectPlanningRecurring.new({ "NumberOfRecurrences" => "345" })
    expect(project_planning_recurring.number_of_recurrences).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    project_planning_recurring = Elmas::ProjectPlanningRecurring.new({ this_does_not_exist: "Piet" })
    expect(project_planning_recurring.try(:number_of_recurrences)).to eq nil
  end

  it "is valid with mandatory attributes" do
    project_planning_recurring = Elmas::ProjectPlanningRecurring.new(description: "Description", employee: "Employee", hour_type: "HourType", start_date: "StartDate", status: "Status")
    expect(project_planning_recurring.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    project_planning_recurring = Elmas::ProjectPlanningRecurring.new
    expect(project_planning_recurring.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProjectPlanningRecurring.new(id: "12abcdef-1234-1234-1234-123456abcdef", number_of_recurrences: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/ProjectPlanningRecurring(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/ProjectPlanningRecurring?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/ProjectPlanningRecurring?$filter=NumberOfRecurrences eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:number_of_recurrences, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/ProjectPlanningRecurring?$orderby=NumberOfRecurrences&$filter=NumberOfRecurrences eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:number_of_recurrences, :id], order_by: :number_of_recurrences)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/ProjectPlanningRecurring?$orderby=NumberOfRecurrences")
      resource.find_all(order_by: :number_of_recurrences)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectPlanningRecurring?$select=NumberOfRecurrences")
      resource.find_all(select: [:number_of_recurrences])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/ProjectPlanningRecurring?$select=NumberOfRecurrences")
      resource.find_by(select: [:number_of_recurrences])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectPlanningRecurring?$select=NumberOfRecurrences,ID")
      resource.find_all(select: [:number_of_recurrences, :id])
    end
  end
end
