require 'spec_helper'

describe Elmas::ItemDetailsByID do
  it "can initialize" do
    item_details_by_id = Elmas::ItemDetailsByID.new
    expect(item_details_by_id).to be_a(Elmas::ItemDetailsByID)
  end

  it "accepts attribute setter" do
    item_details_by_id = Elmas::ItemDetailsByID.new
    item_details_by_id.sales_price = "78238"
    expect(item_details_by_id.sales_price).to eq "78238"
  end

  it "returns value for getters" do
    item_details_by_id = Elmas::ItemDetailsByID.new({ "SalesPrice" => "345" })
    expect(item_details_by_id.sales_price).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    item_details_by_id = Elmas::ItemDetailsByID.new({ this_does_not_exist: "Piet" })
    expect(item_details_by_id.try(:sales_price)).to eq nil
  end



  let(:resource) { resource = Elmas::ItemDetailsByID.new(id: "12abcdef-1234-1234-1234-123456abcdef", sales_price: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/logistics/ItemDetailsByID(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/logistics/ItemDetailsByID?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/logistics/ItemDetailsByID?$filter=SalesPrice eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:sales_price, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/logistics/ItemDetailsByID?$orderby=SalesPrice&$filter=SalesPrice eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:sales_price, :id], order_by: :sales_price)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/logistics/ItemDetailsByID?$orderby=SalesPrice")
      resource.find_all(order_by: :sales_price)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/logistics/ItemDetailsByID?$select=SalesPrice")
      resource.find_all(select: [:sales_price])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/logistics/ItemDetailsByID?$select=SalesPrice")
      resource.find_by(select: [:sales_price])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/logistics/ItemDetailsByID?$select=SalesPrice,ID")
      resource.find_all(select: [:sales_price, :id])
    end
  end
end
