require 'spec_helper'

describe Elmas::TimeAndBillingEntryAccountsByProjectAndDate do
  it "can initialize" do
    time_and_billing_entry_accounts_by_project_and_date = Elmas::TimeAndBillingEntryAccountsByProjectAndDate.new
    expect(time_and_billing_entry_accounts_by_project_and_date).to be_a(Elmas::TimeAndBillingEntryAccountsByProjectAndDate)
  end

  it "accepts attribute setter" do
    time_and_billing_entry_accounts_by_project_and_date = Elmas::TimeAndBillingEntryAccountsByProjectAndDate.new
    time_and_billing_entry_accounts_by_project_and_date.account_id = "78238"
    expect(time_and_billing_entry_accounts_by_project_and_date.account_id).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_entry_accounts_by_project_and_date = Elmas::TimeAndBillingEntryAccountsByProjectAndDate.new({ "AccountID" => "345" })
    expect(time_and_billing_entry_accounts_by_project_and_date.account_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_entry_accounts_by_project_and_date = Elmas::TimeAndBillingEntryAccountsByProjectAndDate.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_entry_accounts_by_project_and_date.try(:account_id)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingEntryAccountsByProjectAndDate.new(id: "12abcdef-1234-1234-1234-123456abcdef", account_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryAccountsByProjectAndDate(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryAccountsByProjectAndDate?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryAccountsByProjectAndDate?$filter=AccountID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryAccountsByProjectAndDate?$orderby=AccountID&$filter=AccountID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account_id, :id], order_by: :account_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryAccountsByProjectAndDate?$orderby=AccountID")
      resource.find_all(order_by: :account_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryAccountsByProjectAndDate?$select=AccountID")
      resource.find_all(select: [:account_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryAccountsByProjectAndDate?$select=AccountID")
      resource.find_by(select: [:account_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryAccountsByProjectAndDate?$select=AccountID,ID")
      resource.find_all(select: [:account_id, :id])
    end
  end
end
