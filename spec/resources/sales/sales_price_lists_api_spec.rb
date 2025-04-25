require 'spec_helper'

describe Elmas::SalesPriceList do
  it "can initialize" do
    sales_price_list = Elmas::SalesPriceList.new
    expect(sales_price_list).to be_a(Elmas::SalesPriceList)
  end

  it "accepts attribute setter" do
    sales_price_list = Elmas::SalesPriceList.new
    sales_price_list.modifier = "78238"
    expect(sales_price_list.modifier).to eq "78238"
  end

  it "returns value for getters" do
    sales_price_list = Elmas::SalesPriceList.new({ "Modifier" => "345" })
    expect(sales_price_list.modifier).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sales_price_list = Elmas::SalesPriceList.new({ this_does_not_exist: "Piet" })
    expect(sales_price_list.try(:modifier)).to eq nil
  end



  let(:resource) { resource = Elmas::SalesPriceList.new(id: "12abcdef-1234-1234-1234-123456abcdef", modifier: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sales/SalesPriceLists(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sales/SalesPriceLists?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sales/SalesPriceLists?$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sales/SalesPriceLists?$orderby=Modifier&$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id], order_by: :modifier)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sales/SalesPriceLists?$orderby=Modifier")
      resource.find_all(order_by: :modifier)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sales/SalesPriceLists?$select=Modifier")
      resource.find_all(select: [:modifier])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sales/SalesPriceLists?$select=Modifier")
      resource.find_by(select: [:modifier])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sales/SalesPriceLists?$select=Modifier,ID")
      resource.find_all(select: [:modifier, :id])
    end
  end
end
