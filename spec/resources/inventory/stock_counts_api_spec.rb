require 'spec_helper'

describe Elmas::StockCount do
  it "can initialize" do
    stock_count = Elmas::StockCount.new
    expect(stock_count).to be_a(Elmas::StockCount)
  end

  it "accepts attribute setter" do
    stock_count = Elmas::StockCount.new
    stock_count.created = "78238"
    expect(stock_count.created).to eq "78238"
  end

  it "returns value for getters" do
    stock_count = Elmas::StockCount.new({ "Created" => "345" })
    expect(stock_count.created).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    stock_count = Elmas::StockCount.new({ this_does_not_exist: "Piet" })
    expect(stock_count.try(:created)).to eq nil
  end

  it "is valid with mandatory attributes" do
    stock_count = Elmas::StockCount.new(stock_count_date: "StockCountDate", stock_count_lines: "StockCountLines", warehouse: "Warehouse")
    expect(stock_count.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    stock_count = Elmas::StockCount.new
    expect(stock_count.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::StockCount.new(id: "12abcdef-1234-1234-1234-123456abcdef", created: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/StockCounts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/StockCounts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/StockCounts?$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/StockCounts?$orderby=Created&$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id], order_by: :created)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/StockCounts?$orderby=Created")
      resource.find_all(order_by: :created)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/StockCounts?$select=Created")
      resource.find_all(select: [:created])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/StockCounts?$select=Created")
      resource.find_by(select: [:created])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/StockCounts?$select=Created,ID")
      resource.find_all(select: [:created, :id])
    end
  end
end
