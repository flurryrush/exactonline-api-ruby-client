require 'spec_helper'

describe Elmas::SyncPayrollEmploymentTaxAuthoritiesGeneral do
  it "can initialize" do
    sync_payroll_employment_tax_authorities_general = Elmas::SyncPayrollEmploymentTaxAuthoritiesGeneral.new
    expect(sync_payroll_employment_tax_authorities_general).to be_a(Elmas::SyncPayrollEmploymentTaxAuthoritiesGeneral)
  end

  it "accepts attribute setter" do
    sync_payroll_employment_tax_authorities_general = Elmas::SyncPayrollEmploymentTaxAuthoritiesGeneral.new
    sync_payroll_employment_tax_authorities_general.employee = "78238"
    expect(sync_payroll_employment_tax_authorities_general.employee).to eq "78238"
  end

  it "returns value for getters" do
    sync_payroll_employment_tax_authorities_general = Elmas::SyncPayrollEmploymentTaxAuthoritiesGeneral.new({ "Employee" => "345" })
    expect(sync_payroll_employment_tax_authorities_general.employee).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_payroll_employment_tax_authorities_general = Elmas::SyncPayrollEmploymentTaxAuthoritiesGeneral.new({ this_does_not_exist: "Piet" })
    expect(sync_payroll_employment_tax_authorities_general.try(:employee)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncPayrollEmploymentTaxAuthoritiesGeneral.new(id: "12abcdef-1234-1234-1234-123456abcdef", employee: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentTaxAuthoritiesGeneral(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentTaxAuthoritiesGeneral?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentTaxAuthoritiesGeneral?$filter=Employee eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentTaxAuthoritiesGeneral?$orderby=Employee&$filter=Employee eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee, :id], order_by: :employee)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentTaxAuthoritiesGeneral?$orderby=Employee")
      resource.find_all(order_by: :employee)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentTaxAuthoritiesGeneral?$select=Employee")
      resource.find_all(select: [:employee])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentTaxAuthoritiesGeneral?$select=Employee")
      resource.find_by(select: [:employee])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentTaxAuthoritiesGeneral?$select=Employee,ID")
      resource.find_all(select: [:employee, :id])
    end
  end
end
