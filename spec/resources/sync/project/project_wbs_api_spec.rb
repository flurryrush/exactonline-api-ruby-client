require 'spec_helper'

describe Elmas::SyncProjectProjectWB do
  it "can initialize" do
    sync_project_project_wb = Elmas::SyncProjectProjectWB.new
    expect(sync_project_project_wb).to be_a(Elmas::SyncProjectProjectWB)
  end

  it "accepts attribute setter" do
    sync_project_project_wb = Elmas::SyncProjectProjectWB.new
    sync_project_project_wb.modifier = "78238"
    expect(sync_project_project_wb.modifier).to eq "78238"
  end

  it "returns value for getters" do
    sync_project_project_wb = Elmas::SyncProjectProjectWB.new({ "Modifier" => "345" })
    expect(sync_project_project_wb.modifier).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_project_project_wb = Elmas::SyncProjectProjectWB.new({ this_does_not_exist: "Piet" })
    expect(sync_project_project_wb.try(:modifier)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncProjectProjectWB.new(id: "12abcdef-1234-1234-1234-123456abcdef", modifier: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Project/ProjectWBS(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Project/ProjectWBS?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Project/ProjectWBS?$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Project/ProjectWBS?$orderby=Modifier&$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id], order_by: :modifier)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Project/ProjectWBS?$orderby=Modifier")
      resource.find_all(order_by: :modifier)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Project/ProjectWBS?$select=Modifier")
      resource.find_all(select: [:modifier])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Project/ProjectWBS?$select=Modifier")
      resource.find_by(select: [:modifier])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Project/ProjectWBS?$select=Modifier,ID")
      resource.find_all(select: [:modifier, :id])
    end
  end
end
