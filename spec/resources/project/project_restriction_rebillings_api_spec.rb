require 'spec_helper'

describe Elmas::ProjectRestrictionRebilling do
  it "can initialize" do
    project_restriction_rebilling = Elmas::ProjectRestrictionRebilling.new
    expect(project_restriction_rebilling).to be_a(Elmas::ProjectRestrictionRebilling)
  end

  it "accepts attribute setter" do
    project_restriction_rebilling = Elmas::ProjectRestrictionRebilling.new
    project_restriction_rebilling.cost_type_rebill_description = "78238"
    expect(project_restriction_rebilling.cost_type_rebill_description).to eq "78238"
  end

  it "returns value for getters" do
    project_restriction_rebilling = Elmas::ProjectRestrictionRebilling.new({ "CostTypeRebillDescription" => "345" })
    expect(project_restriction_rebilling.cost_type_rebill_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    project_restriction_rebilling = Elmas::ProjectRestrictionRebilling.new({ this_does_not_exist: "Piet" })
    expect(project_restriction_rebilling.try(:cost_type_rebill_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    project_restriction_rebilling = Elmas::ProjectRestrictionRebilling.new(cost_type_rebill: "CostTypeRebill", project: "Project")
    expect(project_restriction_rebilling.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    project_restriction_rebilling = Elmas::ProjectRestrictionRebilling.new
    expect(project_restriction_rebilling.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProjectRestrictionRebilling.new(id: "12abcdef-1234-1234-1234-123456abcdef", cost_type_rebill_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/ProjectRestrictionRebillings(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/ProjectRestrictionRebillings?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/ProjectRestrictionRebillings?$filter=CostTypeRebillDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_type_rebill_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/ProjectRestrictionRebillings?$orderby=CostTypeRebillDescription&$filter=CostTypeRebillDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_type_rebill_description, :id], order_by: :cost_type_rebill_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/ProjectRestrictionRebillings?$orderby=CostTypeRebillDescription")
      resource.find_all(order_by: :cost_type_rebill_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectRestrictionRebillings?$select=CostTypeRebillDescription")
      resource.find_all(select: [:cost_type_rebill_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/ProjectRestrictionRebillings?$select=CostTypeRebillDescription")
      resource.find_by(select: [:cost_type_rebill_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectRestrictionRebillings?$select=CostTypeRebillDescription,ID")
      resource.find_all(select: [:cost_type_rebill_description, :id])
    end
  end
end
