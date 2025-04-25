require 'spec_helper'

describe Elmas::TimeAndBillingEntryProject do
  it "can initialize" do
    time_and_billing_entry_project = Elmas::TimeAndBillingEntryProject.new
    expect(time_and_billing_entry_project).to be_a(Elmas::TimeAndBillingEntryProject)
  end

  it "accepts attribute setter" do
    time_and_billing_entry_project = Elmas::TimeAndBillingEntryProject.new
    time_and_billing_entry_project.project_description = "78238"
    expect(time_and_billing_entry_project.project_description).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_entry_project = Elmas::TimeAndBillingEntryProject.new({ "ProjectDescription" => "345" })
    expect(time_and_billing_entry_project.project_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_entry_project = Elmas::TimeAndBillingEntryProject.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_entry_project.try(:project_description)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingEntryProject.new(id: "12abcdef-1234-1234-1234-123456abcdef", project_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjects(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjects?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjects?$filter=ProjectDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjects?$orderby=ProjectDescription&$filter=ProjectDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_description, :id], order_by: :project_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjects?$orderby=ProjectDescription")
      resource.find_all(order_by: :project_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjects?$select=ProjectDescription")
      resource.find_all(select: [:project_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjects?$select=ProjectDescription")
      resource.find_by(select: [:project_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjects?$select=ProjectDescription,ID")
      resource.find_all(select: [:project_description, :id])
    end
  end
end
