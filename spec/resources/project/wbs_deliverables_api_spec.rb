require 'spec_helper'

describe Elmas::WBSDeliverable do
  it "can initialize" do
    wbs_deliverable = Elmas::WBSDeliverable.new
    expect(wbs_deliverable).to be_a(Elmas::WBSDeliverable)
  end

  it "accepts attribute setter" do
    wbs_deliverable = Elmas::WBSDeliverable.new
    wbs_deliverable.project_description = "78238"
    expect(wbs_deliverable.project_description).to eq "78238"
  end

  it "returns value for getters" do
    wbs_deliverable = Elmas::WBSDeliverable.new({ "ProjectDescription" => "345" })
    expect(wbs_deliverable.project_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    wbs_deliverable = Elmas::WBSDeliverable.new({ this_does_not_exist: "Piet" })
    expect(wbs_deliverable.try(:project_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    wbs_deliverable = Elmas::WBSDeliverable.new(description: "Description", project: "Project")
    expect(wbs_deliverable.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    wbs_deliverable = Elmas::WBSDeliverable.new
    expect(wbs_deliverable.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::WBSDeliverable.new(id: "12abcdef-1234-1234-1234-123456abcdef", project_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/WBSDeliverables(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/WBSDeliverables?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/WBSDeliverables?$filter=ProjectDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/WBSDeliverables?$orderby=ProjectDescription&$filter=ProjectDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_description, :id], order_by: :project_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/WBSDeliverables?$orderby=ProjectDescription")
      resource.find_all(order_by: :project_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/WBSDeliverables?$select=ProjectDescription")
      resource.find_all(select: [:project_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/WBSDeliverables?$select=ProjectDescription")
      resource.find_by(select: [:project_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/WBSDeliverables?$select=ProjectDescription,ID")
      resource.find_all(select: [:project_description, :id])
    end
  end
end
