require 'spec_helper'

describe Elmas::BulkProjectProjectWB do
  it "can initialize" do
    bulk_project_project_wb = Elmas::BulkProjectProjectWB.new
    expect(bulk_project_project_wb).to be_a(Elmas::BulkProjectProjectWB)
  end

  it "accepts attribute setter" do
    bulk_project_project_wb = Elmas::BulkProjectProjectWB.new
    bulk_project_project_wb.cost = "78238"
    expect(bulk_project_project_wb.cost).to eq "78238"
  end

  it "returns value for getters" do
    bulk_project_project_wb = Elmas::BulkProjectProjectWB.new({ "Cost" => "345" })
    expect(bulk_project_project_wb.cost).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_project_project_wb = Elmas::BulkProjectProjectWB.new({ this_does_not_exist: "Piet" })
    expect(bulk_project_project_wb.try(:cost)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_project_project_wb = Elmas::BulkProjectProjectWB.new(description: "Description")
    expect(bulk_project_project_wb.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_project_project_wb = Elmas::BulkProjectProjectWB.new
    expect(bulk_project_project_wb.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkProjectProjectWB.new(id: "12abcdef-1234-1234-1234-123456abcdef", cost: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/Project/ProjectWBS(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/Project/ProjectWBS?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/Project/ProjectWBS?$filter=Cost eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/Project/ProjectWBS?$orderby=Cost&$filter=Cost eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost, :id], order_by: :cost)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/Project/ProjectWBS?$orderby=Cost")
      resource.find_all(order_by: :cost)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Project/ProjectWBS?$select=Cost")
      resource.find_all(select: [:cost])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/Project/ProjectWBS?$select=Cost")
      resource.find_by(select: [:cost])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Project/ProjectWBS?$select=Cost,ID")
      resource.find_all(select: [:cost, :id])
    end
  end
end
