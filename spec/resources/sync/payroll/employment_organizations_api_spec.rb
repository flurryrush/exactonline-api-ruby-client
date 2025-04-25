require 'spec_helper'

describe Elmas::SyncPayrollEmploymentOrganization do
  it "can initialize" do
    sync_payroll_employment_organization = Elmas::SyncPayrollEmploymentOrganization.new
    expect(sync_payroll_employment_organization).to be_a(Elmas::SyncPayrollEmploymentOrganization)
  end

  it "accepts attribute setter" do
    sync_payroll_employment_organization = Elmas::SyncPayrollEmploymentOrganization.new
    sync_payroll_employment_organization.employee = "78238"
    expect(sync_payroll_employment_organization.employee).to eq "78238"
  end

  it "returns value for getters" do
    sync_payroll_employment_organization = Elmas::SyncPayrollEmploymentOrganization.new({ "Employee" => "345" })
    expect(sync_payroll_employment_organization.employee).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_payroll_employment_organization = Elmas::SyncPayrollEmploymentOrganization.new({ this_does_not_exist: "Piet" })
    expect(sync_payroll_employment_organization.try(:employee)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_payroll_employment_organization = Elmas::SyncPayrollEmploymentOrganization.new(department: "Department", employment: "Employment", job_title: "JobTitle")
    expect(sync_payroll_employment_organization.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_payroll_employment_organization = Elmas::SyncPayrollEmploymentOrganization.new
    expect(sync_payroll_employment_organization.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncPayrollEmploymentOrganization.new(id: "12abcdef-1234-1234-1234-123456abcdef", employee: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentOrganizations(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentOrganizations?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentOrganizations?$filter=Employee eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentOrganizations?$orderby=Employee&$filter=Employee eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee, :id], order_by: :employee)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentOrganizations?$orderby=Employee")
      resource.find_all(order_by: :employee)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentOrganizations?$select=Employee")
      resource.find_all(select: [:employee])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentOrganizations?$select=Employee")
      resource.find_by(select: [:employee])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Payroll/EmploymentOrganizations?$select=Employee,ID")
      resource.find_all(select: [:employee, :id])
    end
  end
end
