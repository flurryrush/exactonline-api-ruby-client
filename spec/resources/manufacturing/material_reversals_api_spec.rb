require 'spec_helper'

describe Elmas::MaterialReversal do
  it "can initialize" do
    material_reversal = Elmas::MaterialReversal.new
    expect(material_reversal).to be_a(Elmas::MaterialReversal)
  end

  it "accepts attribute setter" do
    material_reversal = Elmas::MaterialReversal.new
    material_reversal.item = "78238"
    expect(material_reversal.item).to eq "78238"
  end

  it "returns value for getters" do
    material_reversal = Elmas::MaterialReversal.new({ "Item" => "345" })
    expect(material_reversal.item).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    material_reversal = Elmas::MaterialReversal.new({ this_does_not_exist: "Piet" })
    expect(material_reversal.try(:item)).to eq nil
  end

  it "is valid with mandatory attributes" do
    material_reversal = Elmas::MaterialReversal.new(original_stock_transaction_id: "OriginalStockTransactionID", transaction_date: "TransactionDate")
    expect(material_reversal.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    material_reversal = Elmas::MaterialReversal.new
    expect(material_reversal.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::MaterialReversal.new(id: "12abcdef-1234-1234-1234-123456abcdef", item: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/MaterialReversals(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/MaterialReversals?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/MaterialReversals?$filter=Item eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/MaterialReversals?$orderby=Item&$filter=Item eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item, :id], order_by: :item)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/MaterialReversals?$orderby=Item")
      resource.find_all(order_by: :item)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/MaterialReversals?$select=Item")
      resource.find_all(select: [:item])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/MaterialReversals?$select=Item")
      resource.find_by(select: [:item])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/MaterialReversals?$select=Item,ID")
      resource.find_all(select: [:item, :id])
    end
  end
end
