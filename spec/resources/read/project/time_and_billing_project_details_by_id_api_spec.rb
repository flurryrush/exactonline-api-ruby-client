require 'spec_helper'

describe Elmas::TimeAndBillingProjectDetailsByID do
  it "can initialize" do
    time_and_billing_project_details_by_id = Elmas::TimeAndBillingProjectDetailsByID.new
    expect(time_and_billing_project_details_by_id).to be_a(Elmas::TimeAndBillingProjectDetailsByID)
  end

  it "accepts attribute setter" do
    time_and_billing_project_details_by_id = Elmas::TimeAndBillingProjectDetailsByID.new
    time_and_billing_project_details_by_id.account = "78238"
    expect(time_and_billing_project_details_by_id.account).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_project_details_by_id = Elmas::TimeAndBillingProjectDetailsByID.new({ "Account" => "345" })
    expect(time_and_billing_project_details_by_id.account).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_project_details_by_id = Elmas::TimeAndBillingProjectDetailsByID.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_project_details_by_id.try(:account)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingProjectDetailsByID.new(id: "12abcdef-1234-1234-1234-123456abcdef", account: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetailsByID(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetailsByID?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetailsByID?$filter=Account eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetailsByID?$orderby=Account&$filter=Account eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account, :id], order_by: :account)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetailsByID?$orderby=Account")
      resource.find_all(order_by: :account)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetailsByID?$select=Account")
      resource.find_all(select: [:account])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetailsByID?$select=Account")
      resource.find_by(select: [:account])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetailsByID?$select=Account,ID")
      resource.find_all(select: [:account, :id])
    end
  end
end
