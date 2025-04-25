require 'spec_helper'

describe Elmas::SyncProjectProjectPlanning do
  it "can initialize" do
    sync_project_project_planning = Elmas::SyncProjectProjectPlanning.new
    expect(sync_project_project_planning).to be_a(Elmas::SyncProjectProjectPlanning)
  end

  it "accepts attribute setter" do
    sync_project_project_planning = Elmas::SyncProjectProjectPlanning.new
    sync_project_project_planning.creator_full_name = "78238"
    expect(sync_project_project_planning.creator_full_name).to eq "78238"
  end

  it "returns value for getters" do
    sync_project_project_planning = Elmas::SyncProjectProjectPlanning.new({ "CreatorFullName" => "345" })
    expect(sync_project_project_planning.creator_full_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_project_project_planning = Elmas::SyncProjectProjectPlanning.new({ this_does_not_exist: "Piet" })
    expect(sync_project_project_planning.try(:creator_full_name)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_project_project_planning = Elmas::SyncProjectProjectPlanning.new(description: "Description", employee: "Employee", end_date: "EndDate", hour_type: "HourType", start_date: "StartDate", status: "Status")
    expect(sync_project_project_planning.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_project_project_planning = Elmas::SyncProjectProjectPlanning.new
    expect(sync_project_project_planning.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncProjectProjectPlanning.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator_full_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Project/ProjectPlanning(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Project/ProjectPlanning?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Project/ProjectPlanning?$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Project/ProjectPlanning?$orderby=CreatorFullName&$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id], order_by: :creator_full_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Project/ProjectPlanning?$orderby=CreatorFullName")
      resource.find_all(order_by: :creator_full_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Project/ProjectPlanning?$select=CreatorFullName")
      resource.find_all(select: [:creator_full_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Project/ProjectPlanning?$select=CreatorFullName")
      resource.find_by(select: [:creator_full_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Project/ProjectPlanning?$select=CreatorFullName,ID")
      resource.find_all(select: [:creator_full_name, :id])
    end
  end
end
