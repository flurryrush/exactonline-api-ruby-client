require 'spec_helper'

describe Elmas::GoodsReceiptLine do
  it "can initialize" do
    goods_receipt_line = Elmas::GoodsReceiptLine.new
    expect(goods_receipt_line).to be_a(Elmas::GoodsReceiptLine)
  end

  it "accepts attribute setter" do
    goods_receipt_line = Elmas::GoodsReceiptLine.new
    goods_receipt_line.modified = "78238"
    expect(goods_receipt_line.modified).to eq "78238"
  end

  it "returns value for getters" do
    goods_receipt_line = Elmas::GoodsReceiptLine.new({ "Modified" => "345" })
    expect(goods_receipt_line.modified).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    goods_receipt_line = Elmas::GoodsReceiptLine.new({ this_does_not_exist: "Piet" })
    expect(goods_receipt_line.try(:modified)).to eq nil
  end

  it "is valid with mandatory attributes" do
    goods_receipt_line = Elmas::GoodsReceiptLine.new(purchase_order_line_id: "PurchaseOrderLineID", quantity_received: "QuantityReceived")
    expect(goods_receipt_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    goods_receipt_line = Elmas::GoodsReceiptLine.new
    expect(goods_receipt_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::GoodsReceiptLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", modified: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceiptLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceiptLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceiptLines?$filter=Modified eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modified, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceiptLines?$orderby=Modified&$filter=Modified eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modified, :id], order_by: :modified)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceiptLines?$orderby=Modified")
      resource.find_all(order_by: :modified)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceiptLines?$select=Modified")
      resource.find_all(select: [:modified])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceiptLines?$select=Modified")
      resource.find_by(select: [:modified])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/GoodsReceiptLines?$select=Modified,ID")
      resource.find_all(select: [:modified, :id])
    end
  end
end
