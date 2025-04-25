require 'spec_helper'

describe Elmas::ReviewQuotation do
  it "can initialize" do
    review_quotation = Elmas::ReviewQuotation.new
    expect(review_quotation).to be_a(Elmas::ReviewQuotation)
  end

  it "accepts attribute setter" do
    review_quotation = Elmas::ReviewQuotation.new
    review_quotation.copy_item_prices = "78238"
    expect(review_quotation.copy_item_prices).to eq "78238"
  end

  it "returns value for getters" do
    review_quotation = Elmas::ReviewQuotation.new({ "CopyItemPrices" => "345" })
    expect(review_quotation.copy_item_prices).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    review_quotation = Elmas::ReviewQuotation.new({ this_does_not_exist: "Piet" })
    expect(review_quotation.try(:copy_item_prices)).to eq nil
  end

  it "is valid with mandatory attributes" do
    review_quotation = Elmas::ReviewQuotation.new(quotation_id: "QuotationID")
    expect(review_quotation.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    review_quotation = Elmas::ReviewQuotation.new
    expect(review_quotation.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ReviewQuotation.new(id: "12abcdef-1234-1234-1234-123456abcdef", copy_item_prices: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/ReviewQuotation(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/ReviewQuotation?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/ReviewQuotation?$filter=CopyItemPrices eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:copy_item_prices, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/ReviewQuotation?$orderby=CopyItemPrices&$filter=CopyItemPrices eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:copy_item_prices, :id], order_by: :copy_item_prices)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/ReviewQuotation?$orderby=CopyItemPrices")
      resource.find_all(order_by: :copy_item_prices)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/ReviewQuotation?$select=CopyItemPrices")
      resource.find_all(select: [:copy_item_prices])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/ReviewQuotation?$select=CopyItemPrices")
      resource.find_by(select: [:copy_item_prices])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/ReviewQuotation?$select=CopyItemPrices,ID")
      resource.find_all(select: [:copy_item_prices, :id])
    end
  end
end
