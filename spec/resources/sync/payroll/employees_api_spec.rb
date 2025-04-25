require 'spec_helper'

describe Elmas::SyncPayrollEmployee do
  it "can initialize" do
    sync_payroll_employee = Elmas::SyncPayrollEmployee.new
    expect(sync_payroll_employee).to be_a(Elmas::SyncPayrollEmployee)
  end

  it "accepts attribute setter" do
    sync_payroll_employee = Elmas::SyncPayrollEmployee.new
    sync_payroll_employee.phone_extension = "78238"
    expect(sync_payroll_employee.phone_extension).to eq "78238"
  end

  it "returns value for getters" do
    sync_payroll_employee = Elmas::SyncPayrollEmployee.new({ "PhoneExtension" => "345" })
    expect(sync_payroll_employee.phone_extension).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_payroll_employee = Elmas::SyncPayrollEmployee.new({ this_does_not_exist: "Piet" })
    expect(sync_payroll_employee.try(:phone_extension)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncPayrollEmployee.new(id: "12abcdef-1234-1234-1234-123456abcdef", phone_extension: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Payroll/Employees(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Payroll/Employees?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Payroll/Employees?$filter=PhoneExtension eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:phone_extension, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Payroll/Employees?$orderby=PhoneExtension&$filter=PhoneExtension eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:phone_extension, :id], order_by: :phone_extension)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Payroll/Employees?$orderby=PhoneExtension")
      resource.find_all(order_by: :phone_extension)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Payroll/Employees?$select=PhoneExtension")
      resource.find_all(select: [:phone_extension])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Payroll/Employees?$select=PhoneExtension")
      resource.find_by(select: [:phone_extension])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Payroll/Employees?$select=PhoneExtension,ID")
      resource.find_all(select: [:phone_extension, :id])
    end
  end
end
