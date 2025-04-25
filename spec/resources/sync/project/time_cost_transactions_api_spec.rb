require 'spec_helper'

describe Elmas::SyncProjectTimeCostTransaction do
  it "can initialize" do
    sync_project_time_cost_transaction = Elmas::SyncProjectTimeCostTransaction.new
    expect(sync_project_time_cost_transaction).to be_a(Elmas::SyncProjectTimeCostTransaction)
  end

  it "accepts attribute setter" do
    sync_project_time_cost_transaction = Elmas::SyncProjectTimeCostTransaction.new
    sync_project_time_cost_transaction.employee = "78238"
    expect(sync_project_time_cost_transaction.employee).to eq "78238"
  end

  it "returns value for getters" do
    sync_project_time_cost_transaction = Elmas::SyncProjectTimeCostTransaction.new({ "Employee" => "345" })
    expect(sync_project_time_cost_transaction.employee).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_project_time_cost_transaction = Elmas::SyncProjectTimeCostTransaction.new({ this_does_not_exist: "Piet" })
    expect(sync_project_time_cost_transaction.try(:employee)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncProjectTimeCostTransaction.new(id: "12abcdef-1234-1234-1234-123456abcdef", employee: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Project/TimeCostTransactions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Project/TimeCostTransactions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Project/TimeCostTransactions?$filter=Employee eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Project/TimeCostTransactions?$orderby=Employee&$filter=Employee eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee, :id], order_by: :employee)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Project/TimeCostTransactions?$orderby=Employee")
      resource.find_all(order_by: :employee)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Project/TimeCostTransactions?$select=Employee")
      resource.find_all(select: [:employee])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Project/TimeCostTransactions?$select=Employee")
      resource.find_by(select: [:employee])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Project/TimeCostTransactions?$select=Employee,ID")
      resource.find_all(select: [:employee, :id])
    end
  end
end
