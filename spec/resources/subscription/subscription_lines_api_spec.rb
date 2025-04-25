require 'spec_helper'

describe Elmas::SubscriptionLine do
  it "can initialize" do
    subscription_line = Elmas::SubscriptionLine.new
    expect(subscription_line).to be_a(Elmas::SubscriptionLine)
  end

  it "accepts attribute setter" do
    subscription_line = Elmas::SubscriptionLine.new
    subscription_line.to_date = "78238"
    expect(subscription_line.to_date).to eq "78238"
  end

  it "returns value for getters" do
    subscription_line = Elmas::SubscriptionLine.new({ "ToDate" => "345" })
    expect(subscription_line.to_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    subscription_line = Elmas::SubscriptionLine.new({ this_does_not_exist: "Piet" })
    expect(subscription_line.try(:to_date)).to eq nil
  end

  it "is valid with mandatory attributes" do
    subscription_line = Elmas::SubscriptionLine.new(entry_id: "EntryID", item: "Item")
    expect(subscription_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    subscription_line = Elmas::SubscriptionLine.new
    expect(subscription_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SubscriptionLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", to_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionLines?$filter=ToDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:to_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionLines?$orderby=ToDate&$filter=ToDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:to_date, :id], order_by: :to_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("subscription/SubscriptionLines?$orderby=ToDate")
      resource.find_all(order_by: :to_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionLines?$select=ToDate")
      resource.find_all(select: [:to_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionLines?$select=ToDate")
      resource.find_by(select: [:to_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("subscription/SubscriptionLines?$select=ToDate,ID")
      resource.find_all(select: [:to_date, :id])
    end
  end
end
