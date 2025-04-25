require 'spec_helper'

describe Elmas::SubscriptionRestrictionEmployee do
  it "can initialize" do
    subscription_restriction_employee = Elmas::SubscriptionRestrictionEmployee.new
    expect(subscription_restriction_employee).to be_a(Elmas::SubscriptionRestrictionEmployee)
  end

  it "accepts attribute setter" do
    subscription_restriction_employee = Elmas::SubscriptionRestrictionEmployee.new
    subscription_restriction_employee.subscription_description = "78238"
    expect(subscription_restriction_employee.subscription_description).to eq "78238"
  end

  it "returns value for getters" do
    subscription_restriction_employee = Elmas::SubscriptionRestrictionEmployee.new({ "SubscriptionDescription" => "345" })
    expect(subscription_restriction_employee.subscription_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    subscription_restriction_employee = Elmas::SubscriptionRestrictionEmployee.new({ this_does_not_exist: "Piet" })
    expect(subscription_restriction_employee.try(:subscription_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    subscription_restriction_employee = Elmas::SubscriptionRestrictionEmployee.new(employee: "Employee", subscription: "Subscription")
    expect(subscription_restriction_employee.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    subscription_restriction_employee = Elmas::SubscriptionRestrictionEmployee.new
    expect(subscription_restriction_employee.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SubscriptionRestrictionEmployee.new(id: "12abcdef-1234-1234-1234-123456abcdef", subscription_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionRestrictionEmployees(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionRestrictionEmployees?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionRestrictionEmployees?$filter=SubscriptionDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:subscription_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionRestrictionEmployees?$orderby=SubscriptionDescription&$filter=SubscriptionDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:subscription_description, :id], order_by: :subscription_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionRestrictionEmployees?$orderby=SubscriptionDescription")
      resource.find_all(order_by: :subscription_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionRestrictionEmployees?$select=SubscriptionDescription")
      resource.find_all(select: [:subscription_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionRestrictionEmployees?$select=SubscriptionDescription")
      resource.find_by(select: [:subscription_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionRestrictionEmployees?$select=SubscriptionDescription,ID")
      resource.find_all(select: [:subscription_description, :id])
    end
  end
end
