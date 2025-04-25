require 'spec_helper'

describe Elmas::ByProductReceipt do
  it "can initialize" do
    by_product_receipt = Elmas::ByProductReceipt.new
    expect(by_product_receipt).to be_a(Elmas::ByProductReceipt)
  end

  it "accepts attribute setter" do
    by_product_receipt = Elmas::ByProductReceipt.new
    by_product_receipt.created_date = "78238"
    expect(by_product_receipt.created_date).to eq "78238"
  end

  it "returns value for getters" do
    by_product_receipt = Elmas::ByProductReceipt.new({ "CreatedDate" => "345" })
    expect(by_product_receipt.created_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    by_product_receipt = Elmas::ByProductReceipt.new({ this_does_not_exist: "Piet" })
    expect(by_product_receipt.try(:created_date)).to eq nil
  end

  it "is valid with mandatory attributes" do
    by_product_receipt = Elmas::ByProductReceipt.new(quantity: "Quantity", shop_order_material_plan: "ShopOrderMaterialPlan", transaction_date: "TransactionDate")
    expect(by_product_receipt.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    by_product_receipt = Elmas::ByProductReceipt.new
    expect(by_product_receipt.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ByProductReceipt.new(id: "12abcdef-1234-1234-1234-123456abcdef", created_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ByProductReceipts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ByProductReceipts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ByProductReceipts?$filter=CreatedDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ByProductReceipts?$orderby=CreatedDate&$filter=CreatedDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created_date, :id], order_by: :created_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ByProductReceipts?$orderby=CreatedDate")
      resource.find_all(order_by: :created_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ByProductReceipts?$select=CreatedDate")
      resource.find_all(select: [:created_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ByProductReceipts?$select=CreatedDate")
      resource.find_by(select: [:created_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ByProductReceipts?$select=CreatedDate,ID")
      resource.find_all(select: [:created_date, :id])
    end
  end
end
