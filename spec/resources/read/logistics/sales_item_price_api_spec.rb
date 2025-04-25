require 'spec_helper'

describe Elmas::ReadSalesItemPrice do
  it "can initialize" do
    read_sales_item_price = Elmas::ReadSalesItemPrice.new
    expect(read_sales_item_price).to be_a(Elmas::ReadSalesItemPrice)
  end

  it "accepts attribute setter" do
    read_sales_item_price = Elmas::ReadSalesItemPrice.new
    read_sales_item_price.vat_code = "78238"
    expect(read_sales_item_price.vat_code).to eq "78238"
  end

  it "returns value for getters" do
    read_sales_item_price = Elmas::ReadSalesItemPrice.new({ "VATCode" => "345" })
    expect(read_sales_item_price.vat_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    read_sales_item_price = Elmas::ReadSalesItemPrice.new({ this_does_not_exist: "Piet" })
    expect(read_sales_item_price.try(:vat_code)).to eq nil
  end



  let(:resource) { resource = Elmas::ReadSalesItemPrice.new(id: "12abcdef-1234-1234-1234-123456abcdef", vat_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/logistics/SalesItemPrice(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/logistics/SalesItemPrice?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/logistics/SalesItemPrice?$filter=VATCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:vat_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/logistics/SalesItemPrice?$orderby=VATCode&$filter=VATCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:vat_code, :id], order_by: :vat_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/logistics/SalesItemPrice?$orderby=VATCode")
      resource.find_all(order_by: :vat_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/logistics/SalesItemPrice?$select=VATCode")
      resource.find_all(select: [:vat_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/logistics/SalesItemPrice?$select=VATCode")
      resource.find_by(select: [:vat_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/logistics/SalesItemPrice?$select=VATCode,ID")
      resource.find_all(select: [:vat_code, :id])
    end
  end
end
