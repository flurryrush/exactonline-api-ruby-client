require 'spec_helper'

describe Elmas::EmploymentSalary do
  it "can initialize" do
    employment_salary = Elmas::EmploymentSalary.new
    expect(employment_salary).to be_a(Elmas::EmploymentSalary)
  end

  it "accepts attribute setter" do
    employment_salary = Elmas::EmploymentSalary.new
    employment_salary.average_hours_per_week = "78238"
    expect(employment_salary.average_hours_per_week).to eq "78238"
  end

  it "returns value for getters" do
    employment_salary = Elmas::EmploymentSalary.new({ "AverageHoursPerWeek" => "345" })
    expect(employment_salary.average_hours_per_week).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    employment_salary = Elmas::EmploymentSalary.new({ this_does_not_exist: "Piet" })
    expect(employment_salary.try(:average_hours_per_week)).to eq nil
  end



  let(:resource) { resource = Elmas::EmploymentSalary.new(id: "12abcdef-1234-1234-1234-123456abcdef", average_hours_per_week: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentSalaries(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentSalaries?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentSalaries?$filter=AverageHoursPerWeek eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:average_hours_per_week, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentSalaries?$orderby=AverageHoursPerWeek&$filter=AverageHoursPerWeek eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:average_hours_per_week, :id], order_by: :average_hours_per_week)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentSalaries?$orderby=AverageHoursPerWeek")
      resource.find_all(order_by: :average_hours_per_week)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentSalaries?$select=AverageHoursPerWeek")
      resource.find_all(select: [:average_hours_per_week])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentSalaries?$select=AverageHoursPerWeek")
      resource.find_by(select: [:average_hours_per_week])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentSalaries?$select=AverageHoursPerWeek,ID")
      resource.find_all(select: [:average_hours_per_week, :id])
    end
  end
end
