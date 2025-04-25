require 'spec_helper'

describe Elmas::ManufacturingTimeTransaction do
  it "can initialize" do
    manufacturing_time_transaction = Elmas::ManufacturingTimeTransaction.new
    expect(manufacturing_time_transaction).to be_a(Elmas::ManufacturingTimeTransaction)
  end

  it "accepts attribute setter" do
    manufacturing_time_transaction = Elmas::ManufacturingTimeTransaction.new
    manufacturing_time_transaction.notes = "78238"
    expect(manufacturing_time_transaction.notes).to eq "78238"
  end

  it "returns value for getters" do
    manufacturing_time_transaction = Elmas::ManufacturingTimeTransaction.new({ "Notes" => "345" })
    expect(manufacturing_time_transaction.notes).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    manufacturing_time_transaction = Elmas::ManufacturingTimeTransaction.new({ this_does_not_exist: "Piet" })
    expect(manufacturing_time_transaction.try(:notes)).to eq nil
  end

  it "is valid with mandatory attributes" do
    manufacturing_time_transaction = Elmas::ManufacturingTimeTransaction.new(employee: "Employee", hours: "Hours")
    expect(manufacturing_time_transaction.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    manufacturing_time_transaction = Elmas::ManufacturingTimeTransaction.new
    expect(manufacturing_time_transaction.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ManufacturingTimeTransaction.new(id: "12abcdef-1234-1234-1234-123456abcdef", notes: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/TimeTransactions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/TimeTransactions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/TimeTransactions?$filter=Notes eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:notes, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/TimeTransactions?$orderby=Notes&$filter=Notes eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:notes, :id], order_by: :notes)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/TimeTransactions?$orderby=Notes")
      resource.find_all(order_by: :notes)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/TimeTransactions?$select=Notes")
      resource.find_all(select: [:notes])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/TimeTransactions?$select=Notes")
      resource.find_by(select: [:notes])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/TimeTransactions?$select=Notes,ID")
      resource.find_all(select: [:notes, :id])
    end
  end
end
