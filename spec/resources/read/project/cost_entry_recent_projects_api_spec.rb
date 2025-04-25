require 'spec_helper'

describe Elmas::CostEntryRecentProject do
  it "can initialize" do
    cost_entry_recent_project = Elmas::CostEntryRecentProject.new
    expect(cost_entry_recent_project).to be_a(Elmas::CostEntryRecentProject)
  end

  it "accepts attribute setter" do
    cost_entry_recent_project = Elmas::CostEntryRecentProject.new
    cost_entry_recent_project.project_id = "78238"
    expect(cost_entry_recent_project.project_id).to eq "78238"
  end

  it "returns value for getters" do
    cost_entry_recent_project = Elmas::CostEntryRecentProject.new({ "ProjectID" => "345" })
    expect(cost_entry_recent_project.project_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    cost_entry_recent_project = Elmas::CostEntryRecentProject.new({ this_does_not_exist: "Piet" })
    expect(cost_entry_recent_project.try(:project_id)).to eq nil
  end



  let(:resource) { resource = Elmas::CostEntryRecentProject.new(id: "12abcdef-1234-1234-1234-123456abcdef", project_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/CostEntryRecentProjects(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/CostEntryRecentProjects?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/CostEntryRecentProjects?$filter=ProjectID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/CostEntryRecentProjects?$orderby=ProjectID&$filter=ProjectID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_id, :id], order_by: :project_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/CostEntryRecentProjects?$orderby=ProjectID")
      resource.find_all(order_by: :project_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/CostEntryRecentProjects?$select=ProjectID")
      resource.find_all(select: [:project_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/CostEntryRecentProjects?$select=ProjectID")
      resource.find_by(select: [:project_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/CostEntryRecentProjects?$select=ProjectID,ID")
      resource.find_all(select: [:project_id, :id])
    end
  end
end
