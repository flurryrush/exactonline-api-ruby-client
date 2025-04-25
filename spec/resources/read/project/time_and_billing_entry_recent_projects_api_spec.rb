require 'spec_helper'

describe Elmas::TimeAndBillingEntryRecentProject do
  it "can initialize" do
    time_and_billing_entry_recent_project = Elmas::TimeAndBillingEntryRecentProject.new
    expect(time_and_billing_entry_recent_project).to be_a(Elmas::TimeAndBillingEntryRecentProject)
  end

  it "accepts attribute setter" do
    time_and_billing_entry_recent_project = Elmas::TimeAndBillingEntryRecentProject.new
    time_and_billing_entry_recent_project.date_last_used = "78238"
    expect(time_and_billing_entry_recent_project.date_last_used).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_entry_recent_project = Elmas::TimeAndBillingEntryRecentProject.new({ "DateLastUsed" => "345" })
    expect(time_and_billing_entry_recent_project.date_last_used).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_entry_recent_project = Elmas::TimeAndBillingEntryRecentProject.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_entry_recent_project.try(:date_last_used)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingEntryRecentProject.new(id: "12abcdef-1234-1234-1234-123456abcdef", date_last_used: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentProjects(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentProjects?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentProjects?$filter=DateLastUsed eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:date_last_used, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentProjects?$orderby=DateLastUsed&$filter=DateLastUsed eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:date_last_used, :id], order_by: :date_last_used)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentProjects?$orderby=DateLastUsed")
      resource.find_all(order_by: :date_last_used)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentProjects?$select=DateLastUsed")
      resource.find_all(select: [:date_last_used])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentProjects?$select=DateLastUsed")
      resource.find_by(select: [:date_last_used])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentProjects?$select=DateLastUsed,ID")
      resource.find_all(select: [:date_last_used, :id])
    end
  end
end
