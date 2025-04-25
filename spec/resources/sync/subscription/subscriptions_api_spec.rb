require 'spec_helper'

describe Elmas::SyncSubscriptionSubscription do
  it "can initialize" do
    sync_subscription_subscription = Elmas::SyncSubscriptionSubscription.new
    expect(sync_subscription_subscription).to be_a(Elmas::SyncSubscriptionSubscription)
  end

  it "accepts attribute setter" do
    sync_subscription_subscription = Elmas::SyncSubscriptionSubscription.new
    sync_subscription_subscription.invoice_to_contact_person = "78238"
    expect(sync_subscription_subscription.invoice_to_contact_person).to eq "78238"
  end

  it "returns value for getters" do
    sync_subscription_subscription = Elmas::SyncSubscriptionSubscription.new({ "InvoiceToContactPerson" => "345" })
    expect(sync_subscription_subscription.invoice_to_contact_person).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_subscription_subscription = Elmas::SyncSubscriptionSubscription.new({ this_does_not_exist: "Piet" })
    expect(sync_subscription_subscription.try(:invoice_to_contact_person)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_subscription_subscription = Elmas::SyncSubscriptionSubscription.new(ordered_by: "OrderedBy", subscription_type: "SubscriptionType")
    expect(sync_subscription_subscription.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_subscription_subscription = Elmas::SyncSubscriptionSubscription.new
    expect(sync_subscription_subscription.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncSubscriptionSubscription.new(id: "12abcdef-1234-1234-1234-123456abcdef", invoice_to_contact_person: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Subscription/Subscriptions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Subscription/Subscriptions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Subscription/Subscriptions?$filter=InvoiceToContactPerson eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:invoice_to_contact_person, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Subscription/Subscriptions?$orderby=InvoiceToContactPerson&$filter=InvoiceToContactPerson eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:invoice_to_contact_person, :id], order_by: :invoice_to_contact_person)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Subscription/Subscriptions?$orderby=InvoiceToContactPerson")
      resource.find_all(order_by: :invoice_to_contact_person)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Subscription/Subscriptions?$select=InvoiceToContactPerson")
      resource.find_all(select: [:invoice_to_contact_person])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Subscription/Subscriptions?$select=InvoiceToContactPerson")
      resource.find_by(select: [:invoice_to_contact_person])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Subscription/Subscriptions?$select=InvoiceToContactPerson,ID")
      resource.find_all(select: [:invoice_to_contact_person, :id])
    end
  end
end
