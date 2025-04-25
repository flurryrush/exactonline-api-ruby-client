require 'spec_helper'

describe Elmas::ProjectWBSByProjectAndWB do
  it "can initialize" do
    project_wbs_by_project_and_wb = Elmas::ProjectWBSByProjectAndWB.new
    expect(project_wbs_by_project_and_wb).to be_a(Elmas::ProjectWBSByProjectAndWB)
  end

  it "accepts attribute setter" do
    project_wbs_by_project_and_wb = Elmas::ProjectWBSByProjectAndWB.new
    project_wbs_by_project_and_wb.quantity = "78238"
    expect(project_wbs_by_project_and_wb.quantity).to eq "78238"
  end

  it "returns value for getters" do
    project_wbs_by_project_and_wb = Elmas::ProjectWBSByProjectAndWB.new({ "Quantity" => "345" })
    expect(project_wbs_by_project_and_wb.quantity).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    project_wbs_by_project_and_wb = Elmas::ProjectWBSByProjectAndWB.new({ this_does_not_exist: "Piet" })
    expect(project_wbs_by_project_and_wb.try(:quantity)).to eq nil
  end

  it "is valid with mandatory attributes" do
    project_wbs_by_project_and_wb = Elmas::ProjectWBSByProjectAndWB.new(description: "Description")
    expect(project_wbs_by_project_and_wb.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    project_wbs_by_project_and_wb = Elmas::ProjectWBSByProjectAndWB.new
    expect(project_wbs_by_project_and_wb.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProjectWBSByProjectAndWB.new(id: "12abcdef-1234-1234-1234-123456abcdef", quantity: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProjectAndWBS(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProjectAndWBS?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProjectAndWBS?$filter=Quantity eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:quantity, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProjectAndWBS?$orderby=Quantity&$filter=Quantity eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:quantity, :id], order_by: :quantity)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProjectAndWBS?$orderby=Quantity")
      resource.find_all(order_by: :quantity)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProjectAndWBS?$select=Quantity")
      resource.find_all(select: [:quantity])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProjectAndWBS?$select=Quantity")
      resource.find_by(select: [:quantity])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/ProjectWBSByProjectAndWBS?$select=Quantity,ID")
      resource.find_all(select: [:quantity, :id])
    end
  end
end
