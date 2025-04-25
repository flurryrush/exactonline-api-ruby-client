require 'spec_helper'

describe Elmas::StartedTimedTimeTransaction do
  it "can initialize" do
    started_timed_time_transaction = Elmas::StartedTimedTimeTransaction.new
    expect(started_timed_time_transaction).to be_a(Elmas::StartedTimedTimeTransaction)
  end

  it "accepts attribute setter" do
    started_timed_time_transaction = Elmas::StartedTimedTimeTransaction.new
    started_timed_time_transaction.data_type = "78238"
    expect(started_timed_time_transaction.data_type).to eq "78238"
  end

  it "returns value for getters" do
    started_timed_time_transaction = Elmas::StartedTimedTimeTransaction.new({ "DataType" => "345" })
    expect(started_timed_time_transaction.data_type).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    started_timed_time_transaction = Elmas::StartedTimedTimeTransaction.new({ this_does_not_exist: "Piet" })
    expect(started_timed_time_transaction.try(:data_type)).to eq nil
  end



  let(:resource) { resource = Elmas::StartedTimedTimeTransaction.new(id: "12abcdef-1234-1234-1234-123456abcdef", data_type: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/manufacturing/StartedTimedTimeTransactions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/manufacturing/StartedTimedTimeTransactions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/manufacturing/StartedTimedTimeTransactions?$filter=DataType eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:data_type, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/manufacturing/StartedTimedTimeTransactions?$orderby=DataType&$filter=DataType eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:data_type, :id], order_by: :data_type)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/manufacturing/StartedTimedTimeTransactions?$orderby=DataType")
      resource.find_all(order_by: :data_type)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/manufacturing/StartedTimedTimeTransactions?$select=DataType")
      resource.find_all(select: [:data_type])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/manufacturing/StartedTimedTimeTransactions?$select=DataType")
      resource.find_by(select: [:data_type])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/manufacturing/StartedTimedTimeTransactions?$select=DataType,ID")
      resource.find_all(select: [:data_type, :id])
    end
  end
end
