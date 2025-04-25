require 'spec_helper'

describe Elmas::ProjectRestrictionEmployeeItem do
  it "can initialize" do
    project_restriction_employee_item = Elmas::ProjectRestrictionEmployeeItem.new
    expect(project_restriction_employee_item).to be_a(Elmas::ProjectRestrictionEmployeeItem)
  end

  it "accepts attribute setter" do
    project_restriction_employee_item = Elmas::ProjectRestrictionEmployeeItem.new
    project_restriction_employee_item.item_code = "78238"
    expect(project_restriction_employee_item.item_code).to eq "78238"
  end

  it "returns value for getters" do
    project_restriction_employee_item = Elmas::ProjectRestrictionEmployeeItem.new({ "ItemCode" => "345" })
    expect(project_restriction_employee_item.item_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    project_restriction_employee_item = Elmas::ProjectRestrictionEmployeeItem.new({ this_does_not_exist: "Piet" })
    expect(project_restriction_employee_item.try(:item_code)).to eq nil
  end

  it "is valid with mandatory attributes" do
    project_restriction_employee_item = Elmas::ProjectRestrictionEmployeeItem.new(employee: "Employee", item: "Item", project: "Project")
    expect(project_restriction_employee_item.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    project_restriction_employee_item = Elmas::ProjectRestrictionEmployeeItem.new
    expect(project_restriction_employee_item.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProjectRestrictionEmployeeItem.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/ProjectRestrictionEmployeeItems(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/ProjectRestrictionEmployeeItems?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/ProjectRestrictionEmployeeItems?$filter=ItemCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/ProjectRestrictionEmployeeItems?$orderby=ItemCode&$filter=ItemCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_code, :id], order_by: :item_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/ProjectRestrictionEmployeeItems?$orderby=ItemCode")
      resource.find_all(order_by: :item_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectRestrictionEmployeeItems?$select=ItemCode")
      resource.find_all(select: [:item_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/ProjectRestrictionEmployeeItems?$select=ItemCode")
      resource.find_by(select: [:item_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectRestrictionEmployeeItems?$select=ItemCode,ID")
      resource.find_all(select: [:item_code, :id])
    end
  end
end
