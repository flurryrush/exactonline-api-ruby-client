require 'spec_helper'

describe Elmas::TimeAndBillingEntryRecentHourCostType do
  it "can initialize" do
    time_and_billing_entry_recent_hour_cost_type = Elmas::TimeAndBillingEntryRecentHourCostType.new
    expect(time_and_billing_entry_recent_hour_cost_type).to be_a(Elmas::TimeAndBillingEntryRecentHourCostType)
  end

  it "accepts attribute setter" do
    time_and_billing_entry_recent_hour_cost_type = Elmas::TimeAndBillingEntryRecentHourCostType.new
    time_and_billing_entry_recent_hour_cost_type.item_code = "78238"
    expect(time_and_billing_entry_recent_hour_cost_type.item_code).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_entry_recent_hour_cost_type = Elmas::TimeAndBillingEntryRecentHourCostType.new({ "ItemCode" => "345" })
    expect(time_and_billing_entry_recent_hour_cost_type.item_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_entry_recent_hour_cost_type = Elmas::TimeAndBillingEntryRecentHourCostType.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_entry_recent_hour_cost_type.try(:item_code)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingEntryRecentHourCostType.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentHourCostTypes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentHourCostTypes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentHourCostTypes?$filter=ItemCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentHourCostTypes?$orderby=ItemCode&$filter=ItemCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_code, :id], order_by: :item_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentHourCostTypes?$orderby=ItemCode")
      resource.find_all(order_by: :item_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentHourCostTypes?$select=ItemCode")
      resource.find_all(select: [:item_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentHourCostTypes?$select=ItemCode")
      resource.find_by(select: [:item_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingEntryRecentHourCostTypes?$select=ItemCode,ID")
      resource.find_all(select: [:item_code, :id])
    end
  end
end
