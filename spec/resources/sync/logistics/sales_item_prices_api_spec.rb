require 'spec_helper'

describe Elmas::SyncLogisticsSalesItemPrice do
  it "can initialize" do
    sync_logistics_sales_item_price = Elmas::SyncLogisticsSalesItemPrice.new
    expect(sync_logistics_sales_item_price).to be_a(Elmas::SyncLogisticsSalesItemPrice)
  end

  it "accepts attribute setter" do
    sync_logistics_sales_item_price = Elmas::SyncLogisticsSalesItemPrice.new
    sync_logistics_sales_item_price.employee = "78238"
    expect(sync_logistics_sales_item_price.employee).to eq "78238"
  end

  it "returns value for getters" do
    sync_logistics_sales_item_price = Elmas::SyncLogisticsSalesItemPrice.new({ "Employee" => "345" })
    expect(sync_logistics_sales_item_price.employee).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_logistics_sales_item_price = Elmas::SyncLogisticsSalesItemPrice.new({ this_does_not_exist: "Piet" })
    expect(sync_logistics_sales_item_price.try(:employee)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncLogisticsSalesItemPrice.new(id: "12abcdef-1234-1234-1234-123456abcdef", employee: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Logistics/SalesItemPrices(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Logistics/SalesItemPrices?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Logistics/SalesItemPrices?$filter=Employee eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Logistics/SalesItemPrices?$orderby=Employee&$filter=Employee eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee, :id], order_by: :employee)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Logistics/SalesItemPrices?$orderby=Employee")
      resource.find_all(order_by: :employee)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Logistics/SalesItemPrices?$select=Employee")
      resource.find_all(select: [:employee])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Logistics/SalesItemPrices?$select=Employee")
      resource.find_by(select: [:employee])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Logistics/SalesItemPrices?$select=Employee,ID")
      resource.find_all(select: [:employee, :id])
    end
  end
end
