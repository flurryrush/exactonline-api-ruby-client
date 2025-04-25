require 'spec_helper'

describe Elmas::SyncSalesSalesPriceListVolumeDiscount do
  it "can initialize" do
    sync_sales_sales_price_list_volume_discount = Elmas::SyncSalesSalesPriceListVolumeDiscount.new
    expect(sync_sales_sales_price_list_volume_discount).to be_a(Elmas::SyncSalesSalesPriceListVolumeDiscount)
  end

  it "accepts attribute setter" do
    sync_sales_sales_price_list_volume_discount = Elmas::SyncSalesSalesPriceListVolumeDiscount.new
    sync_sales_sales_price_list_volume_discount.unit = "78238"
    expect(sync_sales_sales_price_list_volume_discount.unit).to eq "78238"
  end

  it "returns value for getters" do
    sync_sales_sales_price_list_volume_discount = Elmas::SyncSalesSalesPriceListVolumeDiscount.new({ "Unit" => "345" })
    expect(sync_sales_sales_price_list_volume_discount.unit).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_sales_sales_price_list_volume_discount = Elmas::SyncSalesSalesPriceListVolumeDiscount.new({ this_does_not_exist: "Piet" })
    expect(sync_sales_sales_price_list_volume_discount.try(:unit)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncSalesSalesPriceListVolumeDiscount.new(id: "12abcdef-1234-1234-1234-123456abcdef", unit: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Sales/SalesPriceListVolumeDiscounts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Sales/SalesPriceListVolumeDiscounts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Sales/SalesPriceListVolumeDiscounts?$filter=Unit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:unit, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Sales/SalesPriceListVolumeDiscounts?$orderby=Unit&$filter=Unit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:unit, :id], order_by: :unit)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Sales/SalesPriceListVolumeDiscounts?$orderby=Unit")
      resource.find_all(order_by: :unit)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Sales/SalesPriceListVolumeDiscounts?$select=Unit")
      resource.find_all(select: [:unit])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Sales/SalesPriceListVolumeDiscounts?$select=Unit")
      resource.find_by(select: [:unit])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Sales/SalesPriceListVolumeDiscounts?$select=Unit,ID")
      resource.find_all(select: [:unit, :id])
    end
  end
end
