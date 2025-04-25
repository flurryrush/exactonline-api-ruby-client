require 'spec_helper'

describe Elmas::StockCountLine do
  it "can initialize" do
    stock_count_line = Elmas::StockCountLine.new
    expect(stock_count_line).to be_a(Elmas::StockCountLine)
  end

  it "accepts attribute setter" do
    stock_count_line = Elmas::StockCountLine.new
    stock_count_line.reason_code_id = "78238"
    expect(stock_count_line.reason_code_id).to eq "78238"
  end

  it "returns value for getters" do
    stock_count_line = Elmas::StockCountLine.new({ "ReasonCodeID" => "345" })
    expect(stock_count_line.reason_code_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    stock_count_line = Elmas::StockCountLine.new({ this_does_not_exist: "Piet" })
    expect(stock_count_line.try(:reason_code_id)).to eq nil
  end

  it "is valid with mandatory attributes" do
    stock_count_line = Elmas::StockCountLine.new(item: "Item", stock_count_id: "StockCountID")
    expect(stock_count_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    stock_count_line = Elmas::StockCountLine.new
    expect(stock_count_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::StockCountLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", reason_code_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/StockCountLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/StockCountLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/StockCountLines?$filter=ReasonCodeID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:reason_code_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/StockCountLines?$orderby=ReasonCodeID&$filter=ReasonCodeID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:reason_code_id, :id], order_by: :reason_code_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/StockCountLines?$orderby=ReasonCodeID")
      resource.find_all(order_by: :reason_code_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/StockCountLines?$select=ReasonCodeID")
      resource.find_all(select: [:reason_code_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/StockCountLines?$select=ReasonCodeID")
      resource.find_by(select: [:reason_code_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/StockCountLines?$select=ReasonCodeID,ID")
      resource.find_all(select: [:reason_code_id, :id])
    end
  end
end
