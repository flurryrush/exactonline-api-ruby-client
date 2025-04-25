require 'spec_helper'

describe Elmas::HourEntryActivitiesByProject do
  it "can initialize" do
    hour_entry_activities_by_project = Elmas::HourEntryActivitiesByProject.new
    expect(hour_entry_activities_by_project).to be_a(Elmas::HourEntryActivitiesByProject)
  end

  it "accepts attribute setter" do
    hour_entry_activities_by_project = Elmas::HourEntryActivitiesByProject.new
    hour_entry_activities_by_project.default_item_description = "78238"
    expect(hour_entry_activities_by_project.default_item_description).to eq "78238"
  end

  it "returns value for getters" do
    hour_entry_activities_by_project = Elmas::HourEntryActivitiesByProject.new({ "DefaultItemDescription" => "345" })
    expect(hour_entry_activities_by_project.default_item_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    hour_entry_activities_by_project = Elmas::HourEntryActivitiesByProject.new({ this_does_not_exist: "Piet" })
    expect(hour_entry_activities_by_project.try(:default_item_description)).to eq nil
  end



  let(:resource) { resource = Elmas::HourEntryActivitiesByProject.new(id: "12abcdef-1234-1234-1234-123456abcdef", default_item_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/HourEntryActivitiesByProject(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/HourEntryActivitiesByProject?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/HourEntryActivitiesByProject?$filter=DefaultItemDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:default_item_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/HourEntryActivitiesByProject?$orderby=DefaultItemDescription&$filter=DefaultItemDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:default_item_description, :id], order_by: :default_item_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/HourEntryActivitiesByProject?$orderby=DefaultItemDescription")
      resource.find_all(order_by: :default_item_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HourEntryActivitiesByProject?$select=DefaultItemDescription")
      resource.find_all(select: [:default_item_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/HourEntryActivitiesByProject?$select=DefaultItemDescription")
      resource.find_by(select: [:default_item_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HourEntryActivitiesByProject?$select=DefaultItemDescription,ID")
      resource.find_all(select: [:default_item_description, :id])
    end
  end
end
