require 'spec_helper'

describe Elmas::ProjectWBSByProject do
  it "can initialize" do
    project_wbs_by_project = Elmas::ProjectWBSByProject.new
    expect(project_wbs_by_project).to be_a(Elmas::ProjectWBSByProject)
  end

  it "accepts attribute setter" do
    project_wbs_by_project = Elmas::ProjectWBSByProject.new
    project_wbs_by_project.end_date = "78238"
    expect(project_wbs_by_project.end_date).to eq "78238"
  end

  it "returns value for getters" do
    project_wbs_by_project = Elmas::ProjectWBSByProject.new({ "EndDate" => "345" })
    expect(project_wbs_by_project.end_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    project_wbs_by_project = Elmas::ProjectWBSByProject.new({ this_does_not_exist: "Piet" })
    expect(project_wbs_by_project.try(:end_date)).to eq nil
  end

  it "is valid with mandatory attributes" do
    project_wbs_by_project = Elmas::ProjectWBSByProject.new(description: "Description")
    expect(project_wbs_by_project.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    project_wbs_by_project = Elmas::ProjectWBSByProject.new
    expect(project_wbs_by_project.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProjectWBSByProject.new(id: "12abcdef-1234-1234-1234-123456abcdef", end_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProject(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProject?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProject?$filter=EndDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:end_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProject?$orderby=EndDate&$filter=EndDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:end_date, :id], order_by: :end_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProject?$orderby=EndDate")
      resource.find_all(order_by: :end_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProject?$select=EndDate")
      resource.find_all(select: [:end_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProject?$select=EndDate")
      resource.find_by(select: [:end_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProject?$select=EndDate,ID")
      resource.find_all(select: [:end_date, :id])
    end
  end
end
