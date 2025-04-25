require 'spec_helper'

describe Elmas::WBSActivity do
  it "can initialize" do
    wbs_activity = Elmas::WBSActivity.new
    expect(wbs_activity).to be_a(Elmas::WBSActivity)
  end

  it "accepts attribute setter" do
    wbs_activity = Elmas::WBSActivity.new
    wbs_activity.type = "78238"
    expect(wbs_activity.type).to eq "78238"
  end

  it "returns value for getters" do
    wbs_activity = Elmas::WBSActivity.new({ "Type" => "345" })
    expect(wbs_activity.type).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    wbs_activity = Elmas::WBSActivity.new({ this_does_not_exist: "Piet" })
    expect(wbs_activity.try(:type)).to eq nil
  end

  it "is valid with mandatory attributes" do
    wbs_activity = Elmas::WBSActivity.new(description: "Description", project: "Project")
    expect(wbs_activity.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    wbs_activity = Elmas::WBSActivity.new
    expect(wbs_activity.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::WBSActivity.new(id: "12abcdef-1234-1234-1234-123456abcdef", type: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/WBSActivities(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/WBSActivities?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/WBSActivities?$filter=Type eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/WBSActivities?$orderby=Type&$filter=Type eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type, :id], order_by: :type)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/WBSActivities?$orderby=Type")
      resource.find_all(order_by: :type)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/WBSActivities?$select=Type")
      resource.find_all(select: [:type])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/WBSActivities?$select=Type")
      resource.find_by(select: [:type])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/WBSActivities?$select=Type,ID")
      resource.find_all(select: [:type, :id])
    end
  end
end
