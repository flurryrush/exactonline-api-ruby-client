require 'spec_helper'

describe Elmas::ProjectPlanning do
  it "can initialize" do
    project_planning = Elmas::ProjectPlanning.new
    expect(project_planning).to be_a(Elmas::ProjectPlanning)
  end

  it "accepts attribute setter" do
    project_planning = Elmas::ProjectPlanning.new
    project_planning.custom_field = "78238"
    expect(project_planning.custom_field).to eq "78238"
  end

  it "returns value for getters" do
    project_planning = Elmas::ProjectPlanning.new({ "CustomField" => "345" })
    expect(project_planning.custom_field).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    project_planning = Elmas::ProjectPlanning.new({ this_does_not_exist: "Piet" })
    expect(project_planning.try(:custom_field)).to eq nil
  end

  it "is valid with mandatory attributes" do
    project_planning = Elmas::ProjectPlanning.new(description: "Description", employee: "Employee", end_date: "EndDate", hour_type: "HourType", start_date: "StartDate", status: "Status")
    expect(project_planning.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    project_planning = Elmas::ProjectPlanning.new
    expect(project_planning.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProjectPlanning.new(id: "12abcdef-1234-1234-1234-123456abcdef", custom_field: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/ProjectPlanning(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/ProjectPlanning?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/ProjectPlanning?$filter=CustomField eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:custom_field, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/ProjectPlanning?$orderby=CustomField&$filter=CustomField eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:custom_field, :id], order_by: :custom_field)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/ProjectPlanning?$orderby=CustomField")
      resource.find_all(order_by: :custom_field)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectPlanning?$select=CustomField")
      resource.find_all(select: [:custom_field])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/ProjectPlanning?$select=CustomField")
      resource.find_by(select: [:custom_field])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectPlanning?$select=CustomField,ID")
      resource.find_all(select: [:custom_field, :id])
    end
  end
end
