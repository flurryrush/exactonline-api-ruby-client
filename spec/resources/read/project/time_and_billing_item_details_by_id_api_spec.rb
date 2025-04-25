require 'spec_helper'

describe Elmas::TimeAndBillingItemDetailsByID do
  it "can initialize" do
    time_and_billing_item_details_by_id = Elmas::TimeAndBillingItemDetailsByID.new
    expect(time_and_billing_item_details_by_id).to be_a(Elmas::TimeAndBillingItemDetailsByID)
  end

  it "accepts attribute setter" do
    time_and_billing_item_details_by_id = Elmas::TimeAndBillingItemDetailsByID.new
    time_and_billing_item_details_by_id.is_sales_item = "78238"
    expect(time_and_billing_item_details_by_id.is_sales_item).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_item_details_by_id = Elmas::TimeAndBillingItemDetailsByID.new({ "IsSalesItem" => "345" })
    expect(time_and_billing_item_details_by_id.is_sales_item).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_item_details_by_id = Elmas::TimeAndBillingItemDetailsByID.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_item_details_by_id.try(:is_sales_item)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingItemDetailsByID.new(id: "12abcdef-1234-1234-1234-123456abcdef", is_sales_item: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetailsByID(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetailsByID?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetailsByID?$filter=IsSalesItem eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_sales_item, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetailsByID?$orderby=IsSalesItem&$filter=IsSalesItem eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_sales_item, :id], order_by: :is_sales_item)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetailsByID?$orderby=IsSalesItem")
      resource.find_all(order_by: :is_sales_item)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetailsByID?$select=IsSalesItem")
      resource.find_all(select: [:is_sales_item])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetailsByID?$select=IsSalesItem")
      resource.find_by(select: [:is_sales_item])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingItemDetailsByID?$select=IsSalesItem,ID")
      resource.find_all(select: [:is_sales_item, :id])
    end
  end
end
