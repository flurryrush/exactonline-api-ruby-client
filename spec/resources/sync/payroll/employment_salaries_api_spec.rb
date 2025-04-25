require 'spec_helper'

describe Elmas::SyncPayrollEmploymentSalary do
  it "can initialize" do
    sync_payroll_employment_salary = Elmas::SyncPayrollEmploymentSalary.new
    expect(sync_payroll_employment_salary).to be_a(Elmas::SyncPayrollEmploymentSalary)
  end

  it "accepts attribute setter" do
    sync_payroll_employment_salary = Elmas::SyncPayrollEmploymentSalary.new
    sync_payroll_employment_salary.salary_based_type = "78238"
    expect(sync_payroll_employment_salary.salary_based_type).to eq "78238"
  end

  it "returns value for getters" do
    sync_payroll_employment_salary = Elmas::SyncPayrollEmploymentSalary.new({ "SalaryBasedType" => "345" })
    expect(sync_payroll_employment_salary.salary_based_type).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_payroll_employment_salary = Elmas::SyncPayrollEmploymentSalary.new({ this_does_not_exist: "Piet" })
    expect(sync_payroll_employment_salary.try(:salary_based_type)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncPayrollEmploymentSalary.new(id: "12abcdef-1234-1234-1234-123456abcdef", salary_based_type: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentSalaries(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentSalaries?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentSalaries?$filter=SalaryBasedType eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:salary_based_type, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentSalaries?$orderby=SalaryBasedType&$filter=SalaryBasedType eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:salary_based_type, :id], order_by: :salary_based_type)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentSalaries?$orderby=SalaryBasedType")
      resource.find_all(order_by: :salary_based_type)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentSalaries?$select=SalaryBasedType")
      resource.find_all(select: [:salary_based_type])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentSalaries?$select=SalaryBasedType")
      resource.find_by(select: [:salary_based_type])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentSalaries?$select=SalaryBasedType,ID")
      resource.find_all(select: [:salary_based_type, :id])
    end
  end
end
