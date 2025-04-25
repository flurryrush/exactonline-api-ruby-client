require 'spec_helper'

describe Elmas::BillOfMaterialMaterial do
  it "can initialize" do
    bill_of_material_material = Elmas::BillOfMaterialMaterial.new
    expect(bill_of_material_material).to be_a(Elmas::BillOfMaterialMaterial)
  end

  it "accepts attribute setter" do
    bill_of_material_material = Elmas::BillOfMaterialMaterial.new
    bill_of_material_material.cost_unit_description = "78238"
    expect(bill_of_material_material.cost_unit_description).to eq "78238"
  end

  it "returns value for getters" do
    bill_of_material_material = Elmas::BillOfMaterialMaterial.new({ "CostUnitDescription" => "345" })
    expect(bill_of_material_material.cost_unit_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bill_of_material_material = Elmas::BillOfMaterialMaterial.new({ this_does_not_exist: "Piet" })
    expect(bill_of_material_material.try(:cost_unit_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bill_of_material_material = Elmas::BillOfMaterialMaterial.new(item_version: "ItemVersion", part_item: "PartItem")
    expect(bill_of_material_material.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bill_of_material_material = Elmas::BillOfMaterialMaterial.new
    expect(bill_of_material_material.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BillOfMaterialMaterial.new(id: "12abcdef-1234-1234-1234-123456abcdef", cost_unit_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/BillOfMaterialMaterials(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/BillOfMaterialMaterials?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/BillOfMaterialMaterials?$filter=CostUnitDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_unit_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/BillOfMaterialMaterials?$orderby=CostUnitDescription&$filter=CostUnitDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_unit_description, :id], order_by: :cost_unit_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/BillOfMaterialMaterials?$orderby=CostUnitDescription")
      resource.find_all(order_by: :cost_unit_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/BillOfMaterialMaterials?$select=CostUnitDescription")
      resource.find_all(select: [:cost_unit_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/BillOfMaterialMaterials?$select=CostUnitDescription")
      resource.find_by(select: [:cost_unit_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/BillOfMaterialMaterials?$select=CostUnitDescription,ID")
      resource.find_all(select: [:cost_unit_description, :id])
    end
  end
end
