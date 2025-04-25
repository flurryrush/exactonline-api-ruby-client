require 'spec_helper'

describe Elmas::TimeAndBillingItemDetail do
  it "can initialize" do
    time_and_billing_item_detail = Elmas::TimeAndBillingItemDetail.new
    expect(time_and_billing_item_detail).to be_a(Elmas::TimeAndBillingItemDetail)
  end

  it "accepts attribute setter" do
    time_and_billing_item_detail = Elmas::TimeAndBillingItemDetail.new
    time_and_billing_item_detail.description = "78238"
    expect(time_and_billing_item_detail.description).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_item_detail = Elmas::TimeAndBillingItemDetail.new({ "Description" => "345" })
    expect(time_and_billing_item_detail.description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_item_detail = Elmas::TimeAndBillingItemDetail.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_item_detail.try(:description)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingItemDetail.new(id: "12abcdef-1234-1234-1234-123456abcdef", description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetails(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetails?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetails?$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetails?$orderby=Description&$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id], order_by: :description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetails?$orderby=Description")
      resource.find_all(order_by: :description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetails?$select=Description")
      resource.find_all(select: [:description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetails?$select=Description")
      resource.find_by(select: [:description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetails?$select=Description,ID")
      resource.find_all(select: [:description, :id])
    end
  end
end
