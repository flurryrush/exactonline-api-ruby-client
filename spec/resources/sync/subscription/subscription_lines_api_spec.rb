require 'spec_helper'

describe Elmas::SyncSubscriptionSubscriptionLine do
  it "can initialize" do
    sync_subscription_subscription_line = Elmas::SyncSubscriptionSubscriptionLine.new
    expect(sync_subscription_subscription_line).to be_a(Elmas::SyncSubscriptionSubscriptionLine)
  end

  it "accepts attribute setter" do
    sync_subscription_subscription_line = Elmas::SyncSubscriptionSubscriptionLine.new
    sync_subscription_subscription_line.from_date = "78238"
    expect(sync_subscription_subscription_line.from_date).to eq "78238"
  end

  it "returns value for getters" do
    sync_subscription_subscription_line = Elmas::SyncSubscriptionSubscriptionLine.new({ "FromDate" => "345" })
    expect(sync_subscription_subscription_line.from_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_subscription_subscription_line = Elmas::SyncSubscriptionSubscriptionLine.new({ this_does_not_exist: "Piet" })
    expect(sync_subscription_subscription_line.try(:from_date)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_subscription_subscription_line = Elmas::SyncSubscriptionSubscriptionLine.new(entry_id: "EntryID", item: "Item")
    expect(sync_subscription_subscription_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_subscription_subscription_line = Elmas::SyncSubscriptionSubscriptionLine.new
    expect(sync_subscription_subscription_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncSubscriptionSubscriptionLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", from_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Subscription/SubscriptionLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Subscription/SubscriptionLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Subscription/SubscriptionLines?$filter=FromDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:from_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Subscription/SubscriptionLines?$orderby=FromDate&$filter=FromDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:from_date, :id], order_by: :from_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Subscription/SubscriptionLines?$orderby=FromDate")
      resource.find_all(order_by: :from_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Subscription/SubscriptionLines?$select=FromDate")
      resource.find_all(select: [:from_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Subscription/SubscriptionLines?$select=FromDate")
      resource.find_by(select: [:from_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Subscription/SubscriptionLines?$select=FromDate,ID")
      resource.find_all(select: [:from_date, :id])
    end
  end
end
