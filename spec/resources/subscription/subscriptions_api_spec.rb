require 'spec_helper'

describe Elmas::Subscription do
  it "can initialize" do
    subscription = Elmas::Subscription.new
    expect(subscription).to be_a(Elmas::Subscription)
  end

  it "accepts attribute setter" do
    subscription = Elmas::Subscription.new
    subscription.number = "78238"
    expect(subscription.number).to eq "78238"
  end

  it "returns value for getters" do
    subscription = Elmas::Subscription.new({ "Number" => "345" })
    expect(subscription.number).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    subscription = Elmas::Subscription.new({ this_does_not_exist: "Piet" })
    expect(subscription.try(:number)).to eq nil
  end

  it "is valid with mandatory attributes" do
    subscription = Elmas::Subscription.new(ordered_by: "OrderedBy", subscription_lines: "SubscriptionLines", subscription_type: "SubscriptionType")
    expect(subscription.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    subscription = Elmas::Subscription.new
    expect(subscription.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::Subscription.new(id: "12abcdef-1234-1234-1234-123456abcdef", number: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("subscription/Subscriptions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("subscription/Subscriptions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("subscription/Subscriptions?$filter=Number eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:number, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("subscription/Subscriptions?$orderby=Number&$filter=Number eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:number, :id], order_by: :number)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("subscription/Subscriptions?$orderby=Number")
      resource.find_all(order_by: :number)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("subscription/Subscriptions?$select=Number")
      resource.find_all(select: [:number])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("subscription/Subscriptions?$select=Number")
      resource.find_by(select: [:number])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("subscription/Subscriptions?$select=Number,ID")
      resource.find_all(select: [:number, :id])
    end
  end
end
