require 'spec_helper'

describe Elmas::TimeAndBillingEntryRecentActivitiesAndExpense do
  it "can initialize" do
    time_and_billing_entry_recent_activities_and_expense = Elmas::TimeAndBillingEntryRecentActivitiesAndExpense.new
    expect(time_and_billing_entry_recent_activities_and_expense).to be_a(Elmas::TimeAndBillingEntryRecentActivitiesAndExpense)
  end

  it "accepts attribute setter" do
    time_and_billing_entry_recent_activities_and_expense = Elmas::TimeAndBillingEntryRecentActivitiesAndExpense.new
    time_and_billing_entry_recent_activities_and_expense.default_item = "78238"
    expect(time_and_billing_entry_recent_activities_and_expense.default_item).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_entry_recent_activities_and_expense = Elmas::TimeAndBillingEntryRecentActivitiesAndExpense.new({ "DefaultItem" => "345" })
    expect(time_and_billing_entry_recent_activities_and_expense.default_item).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_entry_recent_activities_and_expense = Elmas::TimeAndBillingEntryRecentActivitiesAndExpense.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_entry_recent_activities_and_expense.try(:default_item)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingEntryRecentActivitiesAndExpense.new(id: "12abcdef-1234-1234-1234-123456abcdef", default_item: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentActivitiesAndExpenses(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentActivitiesAndExpenses?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentActivitiesAndExpenses?$filter=DefaultItem eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:default_item, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentActivitiesAndExpenses?$orderby=DefaultItem&$filter=DefaultItem eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:default_item, :id], order_by: :default_item)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentActivitiesAndExpenses?$orderby=DefaultItem")
      resource.find_all(order_by: :default_item)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentActivitiesAndExpenses?$select=DefaultItem")
      resource.find_all(select: [:default_item])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentActivitiesAndExpenses?$select=DefaultItem")
      resource.find_by(select: [:default_item])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentActivitiesAndExpenses?$select=DefaultItem,ID")
      resource.find_all(select: [:default_item, :id])
    end
  end
end
