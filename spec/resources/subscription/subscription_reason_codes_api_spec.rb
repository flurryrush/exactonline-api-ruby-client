require 'spec_helper'

describe Elmas::SubscriptionReasonCode do
  it "can initialize" do
    subscription_reason_code = Elmas::SubscriptionReasonCode.new
    expect(subscription_reason_code).to be_a(Elmas::SubscriptionReasonCode)
  end

  it "accepts attribute setter" do
    subscription_reason_code = Elmas::SubscriptionReasonCode.new
    subscription_reason_code.created = "78238"
    expect(subscription_reason_code.created).to eq "78238"
  end

  it "returns value for getters" do
    subscription_reason_code = Elmas::SubscriptionReasonCode.new({ "Created" => "345" })
    expect(subscription_reason_code.created).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    subscription_reason_code = Elmas::SubscriptionReasonCode.new({ this_does_not_exist: "Piet" })
    expect(subscription_reason_code.try(:created)).to eq nil
  end



  let(:resource) { resource = Elmas::SubscriptionReasonCode.new(id: "12abcdef-1234-1234-1234-123456abcdef", created: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionReasonCodes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionReasonCodes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionReasonCodes?$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionReasonCodes?$orderby=Created&$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id], order_by: :created)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionReasonCodes?$orderby=Created")
      resource.find_all(order_by: :created)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionReasonCodes?$select=Created")
      resource.find_all(select: [:created])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionReasonCodes?$select=Created")
      resource.find_by(select: [:created])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionReasonCodes?$select=Created,ID")
      resource.find_all(select: [:created, :id])
    end
  end
end
