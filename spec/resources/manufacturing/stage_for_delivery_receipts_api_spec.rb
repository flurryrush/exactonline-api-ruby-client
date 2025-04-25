require 'spec_helper'

describe Elmas::StageForDeliveryReceipt do
  it "can initialize" do
    stage_for_delivery_receipt = Elmas::StageForDeliveryReceipt.new
    expect(stage_for_delivery_receipt).to be_a(Elmas::StageForDeliveryReceipt)
  end

  it "accepts attribute setter" do
    stage_for_delivery_receipt = Elmas::StageForDeliveryReceipt.new
    stage_for_delivery_receipt.is_fraction_allowed_item = "78238"
    expect(stage_for_delivery_receipt.is_fraction_allowed_item).to eq "78238"
  end

  it "returns value for getters" do
    stage_for_delivery_receipt = Elmas::StageForDeliveryReceipt.new({ "IsFractionAllowedItem" => "345" })
    expect(stage_for_delivery_receipt.is_fraction_allowed_item).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    stage_for_delivery_receipt = Elmas::StageForDeliveryReceipt.new({ this_does_not_exist: "Piet" })
    expect(stage_for_delivery_receipt.try(:is_fraction_allowed_item)).to eq nil
  end

  it "is valid with mandatory attributes" do
    stage_for_delivery_receipt = Elmas::StageForDeliveryReceipt.new(quantity: "Quantity", shop_order: "ShopOrder", transaction_date: "TransactionDate")
    expect(stage_for_delivery_receipt.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    stage_for_delivery_receipt = Elmas::StageForDeliveryReceipt.new
    expect(stage_for_delivery_receipt.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::StageForDeliveryReceipt.new(id: "12abcdef-1234-1234-1234-123456abcdef", is_fraction_allowed_item: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/StageForDeliveryReceipts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/StageForDeliveryReceipts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/StageForDeliveryReceipts?$filter=IsFractionAllowedItem eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_fraction_allowed_item, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/StageForDeliveryReceipts?$orderby=IsFractionAllowedItem&$filter=IsFractionAllowedItem eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_fraction_allowed_item, :id], order_by: :is_fraction_allowed_item)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/StageForDeliveryReceipts?$orderby=IsFractionAllowedItem")
      resource.find_all(order_by: :is_fraction_allowed_item)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/StageForDeliveryReceipts?$select=IsFractionAllowedItem")
      resource.find_all(select: [:is_fraction_allowed_item])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/StageForDeliveryReceipts?$select=IsFractionAllowedItem")
      resource.find_by(select: [:is_fraction_allowed_item])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/StageForDeliveryReceipts?$select=IsFractionAllowedItem,ID")
      resource.find_all(select: [:is_fraction_allowed_item, :id])
    end
  end
end
