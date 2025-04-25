require 'spec_helper'

describe Elmas::SubOrderReceipt do
  it "can initialize" do
    sub_order_receipt = Elmas::SubOrderReceipt.new
    expect(sub_order_receipt).to be_a(Elmas::SubOrderReceipt)
  end

  it "accepts attribute setter" do
    sub_order_receipt = Elmas::SubOrderReceipt.new
    sub_order_receipt.created_by = "78238"
    expect(sub_order_receipt.created_by).to eq "78238"
  end

  it "returns value for getters" do
    sub_order_receipt = Elmas::SubOrderReceipt.new({ "CreatedBy" => "345" })
    expect(sub_order_receipt.created_by).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sub_order_receipt = Elmas::SubOrderReceipt.new({ this_does_not_exist: "Piet" })
    expect(sub_order_receipt.try(:created_by)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sub_order_receipt = Elmas::SubOrderReceipt.new(quantity: "Quantity", sub_shop_order: "SubShopOrder", transaction_date: "TransactionDate")
    expect(sub_order_receipt.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sub_order_receipt = Elmas::SubOrderReceipt.new
    expect(sub_order_receipt.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SubOrderReceipt.new(id: "12abcdef-1234-1234-1234-123456abcdef", created_by: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/SubOrderReceipts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/SubOrderReceipts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/SubOrderReceipts?$filter=CreatedBy eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created_by, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/SubOrderReceipts?$orderby=CreatedBy&$filter=CreatedBy eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created_by, :id], order_by: :created_by)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/SubOrderReceipts?$orderby=CreatedBy")
      resource.find_all(order_by: :created_by)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/SubOrderReceipts?$select=CreatedBy")
      resource.find_all(select: [:created_by])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/SubOrderReceipts?$select=CreatedBy")
      resource.find_by(select: [:created_by])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/SubOrderReceipts?$select=CreatedBy,ID")
      resource.find_all(select: [:created_by, :id])
    end
  end
end
