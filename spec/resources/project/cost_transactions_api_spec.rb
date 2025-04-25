require 'spec_helper'

describe Elmas::CostTransaction do
  it "can initialize" do
    cost_transaction = Elmas::CostTransaction.new
    expect(cost_transaction).to be_a(Elmas::CostTransaction)
  end

  it "accepts attribute setter" do
    cost_transaction = Elmas::CostTransaction.new
    cost_transaction.date = "78238"
    expect(cost_transaction.date).to eq "78238"
  end

  it "returns value for getters" do
    cost_transaction = Elmas::CostTransaction.new({ "Date" => "345" })
    expect(cost_transaction.date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    cost_transaction = Elmas::CostTransaction.new({ this_does_not_exist: "Piet" })
    expect(cost_transaction.try(:date)).to eq nil
  end

  it "is valid with mandatory attributes" do
    cost_transaction = Elmas::CostTransaction.new(item: "Item", quantity: "Quantity")
    expect(cost_transaction.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    cost_transaction = Elmas::CostTransaction.new
    expect(cost_transaction.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::CostTransaction.new(id: "12abcdef-1234-1234-1234-123456abcdef", date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/CostTransactions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/CostTransactions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/CostTransactions?$filter=Date eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/CostTransactions?$orderby=Date&$filter=Date eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:date, :id], order_by: :date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/CostTransactions?$orderby=Date")
      resource.find_all(order_by: :date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/CostTransactions?$select=Date")
      resource.find_all(select: [:date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/CostTransactions?$select=Date")
      resource.find_by(select: [:date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/CostTransactions?$select=Date,ID")
      resource.find_all(select: [:date, :id])
    end
  end
end
