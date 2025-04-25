require 'spec_helper'

describe Elmas::SyncPayrollEmploymentContract do
  it "can initialize" do
    sync_payroll_employment_contract = Elmas::SyncPayrollEmploymentContract.new
    expect(sync_payroll_employment_contract).to be_a(Elmas::SyncPayrollEmploymentContract)
  end

  it "accepts attribute setter" do
    sync_payroll_employment_contract = Elmas::SyncPayrollEmploymentContract.new
    sync_payroll_employment_contract.employee = "78238"
    expect(sync_payroll_employment_contract.employee).to eq "78238"
  end

  it "returns value for getters" do
    sync_payroll_employment_contract = Elmas::SyncPayrollEmploymentContract.new({ "Employee" => "345" })
    expect(sync_payroll_employment_contract.employee).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_payroll_employment_contract = Elmas::SyncPayrollEmploymentContract.new({ this_does_not_exist: "Piet" })
    expect(sync_payroll_employment_contract.try(:employee)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_payroll_employment_contract = Elmas::SyncPayrollEmploymentContract.new(employment: "Employment")
    expect(sync_payroll_employment_contract.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_payroll_employment_contract = Elmas::SyncPayrollEmploymentContract.new
    expect(sync_payroll_employment_contract.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncPayrollEmploymentContract.new(id: "12abcdef-1234-1234-1234-123456abcdef", employee: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentContracts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentContracts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentContracts?$filter=Employee eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentContracts?$orderby=Employee&$filter=Employee eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee, :id], order_by: :employee)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentContracts?$orderby=Employee")
      resource.find_all(order_by: :employee)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentContracts?$select=Employee")
      resource.find_all(select: [:employee])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentContracts?$select=Employee")
      resource.find_by(select: [:employee])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentContracts?$select=Employee,ID")
      resource.find_all(select: [:employee, :id])
    end
  end
end
