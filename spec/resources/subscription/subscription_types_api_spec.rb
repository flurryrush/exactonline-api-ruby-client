require 'spec_helper'

describe Elmas::SubscriptionType do
  it "can initialize" do
    subscription_type = Elmas::SubscriptionType.new
    expect(subscription_type).to be_a(Elmas::SubscriptionType)
  end

  it "accepts attribute setter" do
    subscription_type = Elmas::SubscriptionType.new
    subscription_type.renewal_cancellation_period_unit = "78238"
    expect(subscription_type.renewal_cancellation_period_unit).to eq "78238"
  end

  it "returns value for getters" do
    subscription_type = Elmas::SubscriptionType.new({ "RenewalCancellationPeriodUnit" => "345" })
    expect(subscription_type.renewal_cancellation_period_unit).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    subscription_type = Elmas::SubscriptionType.new({ this_does_not_exist: "Piet" })
    expect(subscription_type.try(:renewal_cancellation_period_unit)).to eq nil
  end



  let(:resource) { resource = Elmas::SubscriptionType.new(id: "12abcdef-1234-1234-1234-123456abcdef", renewal_cancellation_period_unit: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionTypes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionTypes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionTypes?$filter=RenewalCancellationPeriodUnit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:renewal_cancellation_period_unit, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionTypes?$orderby=RenewalCancellationPeriodUnit&$filter=RenewalCancellationPeriodUnit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:renewal_cancellation_period_unit, :id], order_by: :renewal_cancellation_period_unit)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionTypes?$orderby=RenewalCancellationPeriodUnit")
      resource.find_all(order_by: :renewal_cancellation_period_unit)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionTypes?$select=RenewalCancellationPeriodUnit")
      resource.find_all(select: [:renewal_cancellation_period_unit])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionTypes?$select=RenewalCancellationPeriodUnit")
      resource.find_by(select: [:renewal_cancellation_period_unit])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionTypes?$select=RenewalCancellationPeriodUnit,ID")
      resource.find_all(select: [:renewal_cancellation_period_unit, :id])
    end
  end
end
