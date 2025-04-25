require 'spec_helper'

describe Elmas::EmployeeRestrictionItem do
  it "can initialize" do
    employee_restriction_item = Elmas::EmployeeRestrictionItem.new
    expect(employee_restriction_item).to be_a(Elmas::EmployeeRestrictionItem)
  end

  it "accepts attribute setter" do
    employee_restriction_item = Elmas::EmployeeRestrictionItem.new
    employee_restriction_item.employee_hid = "78238"
    expect(employee_restriction_item.employee_hid).to eq "78238"
  end

  it "returns value for getters" do
    employee_restriction_item = Elmas::EmployeeRestrictionItem.new({ "EmployeeHid" => "345" })
    expect(employee_restriction_item.employee_hid).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    employee_restriction_item = Elmas::EmployeeRestrictionItem.new({ this_does_not_exist: "Piet" })
    expect(employee_restriction_item.try(:employee_hid)).to eq nil
  end

  it "is valid with mandatory attributes" do
    employee_restriction_item = Elmas::EmployeeRestrictionItem.new(employee: "Employee", item: "Item")
    expect(employee_restriction_item.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    employee_restriction_item = Elmas::EmployeeRestrictionItem.new
    expect(employee_restriction_item.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::EmployeeRestrictionItem.new(id: "12abcdef-1234-1234-1234-123456abcdef", employee_hid: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/EmployeeRestrictionItems(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/EmployeeRestrictionItems?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/EmployeeRestrictionItems?$filter=EmployeeHid eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee_hid, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/EmployeeRestrictionItems?$orderby=EmployeeHid&$filter=EmployeeHid eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employee_hid, :id], order_by: :employee_hid)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/EmployeeRestrictionItems?$orderby=EmployeeHid")
      resource.find_all(order_by: :employee_hid)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/EmployeeRestrictionItems?$select=EmployeeHid")
      resource.find_all(select: [:employee_hid])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/EmployeeRestrictionItems?$select=EmployeeHid")
      resource.find_by(select: [:employee_hid])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/EmployeeRestrictionItems?$select=EmployeeHid,ID")
      resource.find_all(select: [:employee_hid, :id])
    end
  end
end
