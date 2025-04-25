require 'spec_helper'

describe Elmas::TimedTimeTransaction do
  it "can initialize" do
    timed_time_transaction = Elmas::TimedTimeTransaction.new
    expect(timed_time_transaction).to be_a(Elmas::TimedTimeTransaction)
  end

  it "accepts attribute setter" do
    timed_time_transaction = Elmas::TimedTimeTransaction.new
    timed_time_transaction.machine_hours = "78238"
    expect(timed_time_transaction.machine_hours).to eq "78238"
  end

  it "returns value for getters" do
    timed_time_transaction = Elmas::TimedTimeTransaction.new({ "MachineHours" => "345" })
    expect(timed_time_transaction.machine_hours).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    timed_time_transaction = Elmas::TimedTimeTransaction.new({ this_does_not_exist: "Piet" })
    expect(timed_time_transaction.try(:machine_hours)).to eq nil
  end

  it "is valid with mandatory attributes" do
    timed_time_transaction = Elmas::TimedTimeTransaction.new(employee: "Employee", shop_order_routing_step_plan: "ShopOrderRoutingStepPlan")
    expect(timed_time_transaction.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    timed_time_transaction = Elmas::TimedTimeTransaction.new
    expect(timed_time_transaction.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::TimedTimeTransaction.new(id: "12abcdef-1234-1234-1234-123456abcdef", machine_hours: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/TimedTimeTransactions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/TimedTimeTransactions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/TimedTimeTransactions?$filter=MachineHours eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:machine_hours, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/TimedTimeTransactions?$orderby=MachineHours&$filter=MachineHours eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:machine_hours, :id], order_by: :machine_hours)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/TimedTimeTransactions?$orderby=MachineHours")
      resource.find_all(order_by: :machine_hours)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/TimedTimeTransactions?$select=MachineHours")
      resource.find_all(select: [:machine_hours])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/TimedTimeTransactions?$select=MachineHours")
      resource.find_by(select: [:machine_hours])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/TimedTimeTransactions?$select=MachineHours,ID")
      resource.find_all(select: [:machine_hours, :id])
    end
  end
end
