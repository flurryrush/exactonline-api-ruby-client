require 'spec_helper'

describe Elmas::SalesItemPrice do
  it "can initialize" do
    sales_item_price = Elmas::SalesItemPrice.new
    expect(sales_item_price).to be_a(Elmas::SalesItemPrice)
  end

  it "accepts attribute setter" do
    sales_item_price = Elmas::SalesItemPrice.new
    sales_item_price.quantity = "78238"
    expect(sales_item_price.quantity).to eq "78238"
  end

  it "returns value for getters" do
    sales_item_price = Elmas::SalesItemPrice.new({ "Quantity" => "345" })
    expect(sales_item_price.quantity).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sales_item_price = Elmas::SalesItemPrice.new({ this_does_not_exist: "Piet" })
    expect(sales_item_price.try(:quantity)).to eq nil
  end



  let(:resource) { resource = Elmas::SalesItemPrice.new(id: "12abcdef-1234-1234-1234-123456abcdef", quantity: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("logistics/SalesItemPrices(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("logistics/SalesItemPrices?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("logistics/SalesItemPrices?$filter=Quantity eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:quantity, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("logistics/SalesItemPrices?$orderby=Quantity&$filter=Quantity eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:quantity, :id], order_by: :quantity)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("logistics/SalesItemPrices?$orderby=Quantity")
      resource.find_all(order_by: :quantity)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/SalesItemPrices?$select=Quantity")
      resource.find_all(select: [:quantity])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("logistics/SalesItemPrices?$select=Quantity")
      resource.find_by(select: [:quantity])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/SalesItemPrices?$select=Quantity,ID")
      resource.find_all(select: [:quantity, :id])
    end
  end
end
