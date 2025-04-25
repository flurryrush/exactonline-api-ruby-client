require 'spec_helper'

describe Elmas::SyncProjectProject do
  it "can initialize" do
    sync_project_project = Elmas::SyncProjectProject.new
    expect(sync_project_project).to be_a(Elmas::SyncProjectProject)
  end

  it "accepts attribute setter" do
    sync_project_project = Elmas::SyncProjectProject.new
    sync_project_project.account_code = "78238"
    expect(sync_project_project.account_code).to eq "78238"
  end

  it "returns value for getters" do
    sync_project_project = Elmas::SyncProjectProject.new({ "AccountCode" => "345" })
    expect(sync_project_project.account_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_project_project = Elmas::SyncProjectProject.new({ this_does_not_exist: "Piet" })
    expect(sync_project_project.try(:account_code)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_project_project = Elmas::SyncProjectProject.new(code: "Code", description: "Description", type: "Type")
    expect(sync_project_project.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_project_project = Elmas::SyncProjectProject.new
    expect(sync_project_project.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncProjectProject.new(id: "12abcdef-1234-1234-1234-123456abcdef", account_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Project/Projects(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Project/Projects?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Project/Projects?$filter=AccountCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Project/Projects?$orderby=AccountCode&$filter=AccountCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_code, :id], order_by: :account_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Project/Projects?$orderby=AccountCode")
      resource.find_all(order_by: :account_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Project/Projects?$select=AccountCode")
      resource.find_all(select: [:account_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Project/Projects?$select=AccountCode")
      resource.find_by(select: [:account_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Project/Projects?$select=AccountCode,ID")
      resource.find_all(select: [:account_code, :id])
    end
  end
end
