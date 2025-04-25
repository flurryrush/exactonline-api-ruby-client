require 'spec_helper'

describe Elmas::PurchaseReturn do
  it "can initialize" do
    purchase_return = Elmas::PurchaseReturn.new
    expect(purchase_return).to be_a(Elmas::PurchaseReturn)
  end

  it "accepts attribute setter" do
    purchase_return = Elmas::PurchaseReturn.new
    purchase_return.description = "78238"
    expect(purchase_return.description).to eq "78238"
  end

  it "returns value for getters" do
    purchase_return = Elmas::PurchaseReturn.new({ "Description" => "345" })
    expect(purchase_return.description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    purchase_return = Elmas::PurchaseReturn.new({ this_does_not_exist: "Piet" })
    expect(purchase_return.try(:description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    purchase_return = Elmas::PurchaseReturn.new(purchase_return_lines: "PurchaseReturnLines", return_date: "ReturnDate")
    expect(purchase_return.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    purchase_return = Elmas::PurchaseReturn.new
    expect(purchase_return.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::PurchaseReturn.new(id: "12abcdef-1234-1234-1234-123456abcdef", description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturns(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturns?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturns?$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturns?$orderby=Description&$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id], order_by: :description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturns?$orderby=Description")
      resource.find_all(order_by: :description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturns?$select=Description")
      resource.find_all(select: [:description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturns?$select=Description")
      resource.find_by(select: [:description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("purchaseorder/PurchaseReturns?$select=Description,ID")
      resource.find_all(select: [:description, :id])
    end
  end
end
