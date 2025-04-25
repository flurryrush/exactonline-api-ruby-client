require 'spec_helper'

describe Elmas::VariableMutation do
  it "can initialize" do
    variable_mutation = Elmas::VariableMutation.new
    expect(variable_mutation).to be_a(Elmas::VariableMutation)
  end

  it "accepts attribute setter" do
    variable_mutation = Elmas::VariableMutation.new
    variable_mutation.payroll_component = "78238"
    expect(variable_mutation.payroll_component).to eq "78238"
  end

  it "returns value for getters" do
    variable_mutation = Elmas::VariableMutation.new({ "PayrollComponent" => "345" })
    expect(variable_mutation.payroll_component).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    variable_mutation = Elmas::VariableMutation.new({ this_does_not_exist: "Piet" })
    expect(variable_mutation.try(:payroll_component)).to eq nil
  end

  it "is valid with mandatory attributes" do
    variable_mutation = Elmas::VariableMutation.new(employee_hid: "EmployeeHid", payroll_period: "PayrollPeriod", payroll_year: "PayrollYear", type: "Type", value: "Value")
    expect(variable_mutation.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    variable_mutation = Elmas::VariableMutation.new
    expect(variable_mutation.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::VariableMutation.new(id: "12abcdef-1234-1234-1234-123456abcdef", payroll_component: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("payroll/VariableMutations(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("payroll/VariableMutations?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("payroll/VariableMutations?$filter=PayrollComponent eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:payroll_component, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("payroll/VariableMutations?$orderby=PayrollComponent&$filter=PayrollComponent eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:payroll_component, :id], order_by: :payroll_component)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("payroll/VariableMutations?$orderby=PayrollComponent")
      resource.find_all(order_by: :payroll_component)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/VariableMutations?$select=PayrollComponent")
      resource.find_all(select: [:payroll_component])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("payroll/VariableMutations?$select=PayrollComponent")
      resource.find_by(select: [:payroll_component])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/VariableMutations?$select=PayrollComponent,ID")
      resource.find_all(select: [:payroll_component, :id])
    end
  end
end
