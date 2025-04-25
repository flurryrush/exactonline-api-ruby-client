require 'spec_helper'

describe Elmas::ShopOrderReceipt do
  it "can initialize" do
    shop_order_receipt = Elmas::ShopOrderReceipt.new
    expect(shop_order_receipt).to be_a(Elmas::ShopOrderReceipt)
  end

  it "accepts attribute setter" do
    shop_order_receipt = Elmas::ShopOrderReceipt.new
    shop_order_receipt.created_date = "78238"
    expect(shop_order_receipt.created_date).to eq "78238"
  end

  it "returns value for getters" do
    shop_order_receipt = Elmas::ShopOrderReceipt.new({ "CreatedDate" => "345" })
    expect(shop_order_receipt.created_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    shop_order_receipt = Elmas::ShopOrderReceipt.new({ this_does_not_exist: "Piet" })
    expect(shop_order_receipt.try(:created_date)).to eq nil
  end

  it "is valid with mandatory attributes" do
    shop_order_receipt = Elmas::ShopOrderReceipt.new(quantity: "Quantity", shop_order: "ShopOrder", transaction_date: "TransactionDate")
    expect(shop_order_receipt.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    shop_order_receipt = Elmas::ShopOrderReceipt.new
    expect(shop_order_receipt.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ShopOrderReceipt.new(id: "12abcdef-1234-1234-1234-123456abcdef", created_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReceipts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReceipts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReceipts?$filter=CreatedDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReceipts?$orderby=CreatedDate&$filter=CreatedDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created_date, :id], order_by: :created_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReceipts?$orderby=CreatedDate")
      resource.find_all(order_by: :created_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReceipts?$select=CreatedDate")
      resource.find_all(select: [:created_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReceipts?$select=CreatedDate")
      resource.find_by(select: [:created_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ShopOrderReceipts?$select=CreatedDate,ID")
      resource.find_all(select: [:created_date, :id])
    end
  end
end
