require 'spec_helper'

describe Elmas::ProcessStockCount do
  it "can initialize" do
    process_stock_count = Elmas::ProcessStockCount.new
    expect(process_stock_count).to be_a(Elmas::ProcessStockCount)
  end

  it "accepts attribute setter" do
    process_stock_count = Elmas::ProcessStockCount.new
    process_stock_count.success_message = "78238"
    expect(process_stock_count.success_message).to eq "78238"
  end

  it "returns value for getters" do
    process_stock_count = Elmas::ProcessStockCount.new({ "SuccessMessage" => "345" })
    expect(process_stock_count.success_message).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    process_stock_count = Elmas::ProcessStockCount.new({ this_does_not_exist: "Piet" })
    expect(process_stock_count.try(:success_message)).to eq nil
  end

  it "is valid with mandatory attributes" do
    process_stock_count = Elmas::ProcessStockCount.new(stock_count_id: "StockCountID")
    expect(process_stock_count.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    process_stock_count = Elmas::ProcessStockCount.new
    expect(process_stock_count.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProcessStockCount.new(id: "12abcdef-1234-1234-1234-123456abcdef", success_message: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/ProcessStockCount(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/ProcessStockCount?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/ProcessStockCount?$filter=SuccessMessage eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:success_message, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/ProcessStockCount?$orderby=SuccessMessage&$filter=SuccessMessage eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:success_message, :id], order_by: :success_message)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/ProcessStockCount?$orderby=SuccessMessage")
      resource.find_all(order_by: :success_message)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/ProcessStockCount?$select=SuccessMessage")
      resource.find_all(select: [:success_message])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/ProcessStockCount?$select=SuccessMessage")
      resource.find_by(select: [:success_message])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/ProcessStockCount?$select=SuccessMessage,ID")
      resource.find_all(select: [:success_message, :id])
    end
  end
end
