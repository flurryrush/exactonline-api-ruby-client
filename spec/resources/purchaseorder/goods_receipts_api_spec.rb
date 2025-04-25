require 'spec_helper'

describe Elmas::GoodsReceipt do
  it "can initialize" do
    goods_receipt = Elmas::GoodsReceipt.new
    expect(goods_receipt).to be_a(Elmas::GoodsReceipt)
  end

  it "accepts attribute setter" do
    goods_receipt = Elmas::GoodsReceipt.new
    goods_receipt.warehouse = "78238"
    expect(goods_receipt.warehouse).to eq "78238"
  end

  it "returns value for getters" do
    goods_receipt = Elmas::GoodsReceipt.new({ "Warehouse" => "345" })
    expect(goods_receipt.warehouse).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    goods_receipt = Elmas::GoodsReceipt.new({ this_does_not_exist: "Piet" })
    expect(goods_receipt.try(:warehouse)).to eq nil
  end

  it "is valid with mandatory attributes" do
    goods_receipt = Elmas::GoodsReceipt.new(goods_receipt_lines: "GoodsReceiptLines", receipt_date: "ReceiptDate")
    expect(goods_receipt.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    goods_receipt = Elmas::GoodsReceipt.new
    expect(goods_receipt.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::GoodsReceipt.new(id: "12abcdef-1234-1234-1234-123456abcdef", warehouse: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceipts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceipts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceipts?$filter=Warehouse eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceipts?$orderby=Warehouse&$filter=Warehouse eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse, :id], order_by: :warehouse)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceipts?$orderby=Warehouse")
      resource.find_all(order_by: :warehouse)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceipts?$select=Warehouse")
      resource.find_all(select: [:warehouse])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceipts?$select=Warehouse")
      resource.find_by(select: [:warehouse])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceipts?$select=Warehouse,ID")
      resource.find_all(select: [:warehouse, :id])
    end
  end
end
