require 'spec_helper'

describe Elmas::PurchaseReturnLine do
  it "can initialize" do
    purchase_return_line = Elmas::PurchaseReturnLine.new
    expect(purchase_return_line).to be_a(Elmas::PurchaseReturnLine)
  end

  it "accepts attribute setter" do
    purchase_return_line = Elmas::PurchaseReturnLine.new
    purchase_return_line.project_code = "78238"
    expect(purchase_return_line.project_code).to eq "78238"
  end

  it "returns value for getters" do
    purchase_return_line = Elmas::PurchaseReturnLine.new({ "ProjectCode" => "345" })
    expect(purchase_return_line.project_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    purchase_return_line = Elmas::PurchaseReturnLine.new({ this_does_not_exist: "Piet" })
    expect(purchase_return_line.try(:project_code)).to eq nil
  end

  it "is valid with mandatory attributes" do
    purchase_return_line = Elmas::PurchaseReturnLine.new(goods_receipt_line_id: "GoodsReceiptLineID", purchase_order_line_id: "PurchaseOrderLineID", return_quantity: "ReturnQuantity")
    expect(purchase_return_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    purchase_return_line = Elmas::PurchaseReturnLine.new
    expect(purchase_return_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::PurchaseReturnLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", project_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturnLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturnLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturnLines?$filter=ProjectCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturnLines?$orderby=ProjectCode&$filter=ProjectCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_code, :id], order_by: :project_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturnLines?$orderby=ProjectCode")
      resource.find_all(order_by: :project_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturnLines?$select=ProjectCode")
      resource.find_all(select: [:project_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturnLines?$select=ProjectCode")
      resource.find_by(select: [:project_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturnLines?$select=ProjectCode,ID")
      resource.find_all(select: [:project_code, :id])
    end
  end
end
