require 'spec_helper'

describe Elmas::TimeAndBillingActivitiesAndExpense do
  it "can initialize" do
    time_and_billing_activities_and_expense = Elmas::TimeAndBillingActivitiesAndExpense.new
    expect(time_and_billing_activities_and_expense).to be_a(Elmas::TimeAndBillingActivitiesAndExpense)
  end

  it "accepts attribute setter" do
    time_and_billing_activities_and_expense = Elmas::TimeAndBillingActivitiesAndExpense.new
    time_and_billing_activities_and_expense.default_item_code = "78238"
    expect(time_and_billing_activities_and_expense.default_item_code).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_activities_and_expense = Elmas::TimeAndBillingActivitiesAndExpense.new({ "DefaultItemCode" => "345" })
    expect(time_and_billing_activities_and_expense.default_item_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_activities_and_expense = Elmas::TimeAndBillingActivitiesAndExpense.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_activities_and_expense.try(:default_item_code)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingActivitiesAndExpense.new(id: "12abcdef-1234-1234-1234-123456abcdef", default_item_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingActivitiesAndExpenses(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingActivitiesAndExpenses?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingActivitiesAndExpenses?$filter=DefaultItemCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:default_item_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingActivitiesAndExpenses?$orderby=DefaultItemCode&$filter=DefaultItemCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:default_item_code, :id], order_by: :default_item_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingActivitiesAndExpenses?$orderby=DefaultItemCode")
      resource.find_all(order_by: :default_item_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingActivitiesAndExpenses?$select=DefaultItemCode")
      resource.find_all(select: [:default_item_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingActivitiesAndExpenses?$select=DefaultItemCode")
      resource.find_by(select: [:default_item_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingActivitiesAndExpenses?$select=DefaultItemCode,ID")
      resource.find_all(select: [:default_item_code, :id])
    end
  end
end
