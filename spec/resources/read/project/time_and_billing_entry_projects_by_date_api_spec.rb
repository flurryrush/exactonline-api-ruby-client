require 'spec_helper'

describe Elmas::TimeAndBillingEntryProjectsByDate do
  it "can initialize" do
    time_and_billing_entry_projects_by_date = Elmas::TimeAndBillingEntryProjectsByDate.new
    expect(time_and_billing_entry_projects_by_date).to be_a(Elmas::TimeAndBillingEntryProjectsByDate)
  end

  it "accepts attribute setter" do
    time_and_billing_entry_projects_by_date = Elmas::TimeAndBillingEntryProjectsByDate.new
    time_and_billing_entry_projects_by_date.project_id = "78238"
    expect(time_and_billing_entry_projects_by_date.project_id).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_entry_projects_by_date = Elmas::TimeAndBillingEntryProjectsByDate.new({ "ProjectID" => "345" })
    expect(time_and_billing_entry_projects_by_date.project_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_entry_projects_by_date = Elmas::TimeAndBillingEntryProjectsByDate.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_entry_projects_by_date.try(:project_id)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingEntryProjectsByDate.new(id: "12abcdef-1234-1234-1234-123456abcdef", project_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjectsByDate(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjectsByDate?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjectsByDate?$filter=ProjectID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjectsByDate?$orderby=ProjectID&$filter=ProjectID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_id, :id], order_by: :project_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjectsByDate?$orderby=ProjectID")
      resource.find_all(order_by: :project_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjectsByDate?$select=ProjectID")
      resource.find_all(select: [:project_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjectsByDate?$select=ProjectID")
      resource.find_by(select: [:project_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryProjectsByDate?$select=ProjectID,ID")
      resource.find_all(select: [:project_id, :id])
    end
  end
end
