require 'spec_helper'

describe Elmas::Employee do
  it "can initialize" do
    employee = Elmas::Employee.new
    expect(employee).to be_a(Elmas::Employee)
  end

  it "accepts attribute setter" do
    employee = Elmas::Employee.new
    employee.code = "78238"
    expect(employee.code).to eq "78238"
  end

  it "returns value for getters" do
    employee = Elmas::Employee.new({ "Code" => "345" })
    expect(employee.code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    employee = Elmas::Employee.new({ this_does_not_exist: "Piet" })
    expect(employee.try(:code)).to eq nil
  end



  let(:resource) { resource = Elmas::Employee.new(id: "12abcdef-1234-1234-1234-123456abcdef", code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("payroll/Employees(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("payroll/Employees?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("payroll/Employees?$filter=Code eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("payroll/Employees?$orderby=Code&$filter=Code eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:code, :id], order_by: :code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("payroll/Employees?$orderby=Code")
      resource.find_all(order_by: :code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/Employees?$select=Code")
      resource.find_all(select: [:code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("payroll/Employees?$select=Code")
      resource.find_by(select: [:code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/Employees?$select=Code,ID")
      resource.find_all(select: [:code, :id])
    end
  end
end
