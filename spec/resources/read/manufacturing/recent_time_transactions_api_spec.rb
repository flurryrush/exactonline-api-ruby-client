require 'spec_helper'

describe Elmas::RecentTimeTransaction do
  it "can initialize" do
    recent_time_transaction = Elmas::RecentTimeTransaction.new
    expect(recent_time_transaction).to be_a(Elmas::RecentTimeTransaction)
  end

  it "accepts attribute setter" do
    recent_time_transaction = Elmas::RecentTimeTransaction.new
    recent_time_transaction.date = "78238"
    expect(recent_time_transaction.date).to eq "78238"
  end

  it "returns value for getters" do
    recent_time_transaction = Elmas::RecentTimeTransaction.new({ "Date" => "345" })
    expect(recent_time_transaction.date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    recent_time_transaction = Elmas::RecentTimeTransaction.new({ this_does_not_exist: "Piet" })
    expect(recent_time_transaction.try(:date)).to eq nil
  end



  let(:resource) { resource = Elmas::RecentTimeTransaction.new(id: "12abcdef-1234-1234-1234-123456abcdef", date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/manufacturing/RecentTimeTransactions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/manufacturing/RecentTimeTransactions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/manufacturing/RecentTimeTransactions?$filter=Date eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/manufacturing/RecentTimeTransactions?$orderby=Date&$filter=Date eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:date, :id], order_by: :date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/manufacturing/RecentTimeTransactions?$orderby=Date")
      resource.find_all(order_by: :date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/manufacturing/RecentTimeTransactions?$select=Date")
      resource.find_all(select: [:date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/manufacturing/RecentTimeTransactions?$select=Date")
      resource.find_by(select: [:date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/manufacturing/RecentTimeTransactions?$select=Date,ID")
      resource.find_all(select: [:date, :id])
    end
  end
end
