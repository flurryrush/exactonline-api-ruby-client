require 'spec_helper'

describe Elmas::AssemblyBillOfMaterialMaterial do
  it "can initialize" do
    assembly_bill_of_material_material = Elmas::AssemblyBillOfMaterialMaterial.new
    expect(assembly_bill_of_material_material).to be_a(Elmas::AssemblyBillOfMaterialMaterial)
  end

  it "accepts attribute setter" do
    assembly_bill_of_material_material = Elmas::AssemblyBillOfMaterialMaterial.new
    assembly_bill_of_material_material.update_cost_price = "78238"
    expect(assembly_bill_of_material_material.update_cost_price).to eq "78238"
  end

  it "returns value for getters" do
    assembly_bill_of_material_material = Elmas::AssemblyBillOfMaterialMaterial.new({ "UpdateCostPrice" => "345" })
    expect(assembly_bill_of_material_material.update_cost_price).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    assembly_bill_of_material_material = Elmas::AssemblyBillOfMaterialMaterial.new({ this_does_not_exist: "Piet" })
    expect(assembly_bill_of_material_material.try(:update_cost_price)).to eq nil
  end

  it "is valid with mandatory attributes" do
    assembly_bill_of_material_material = Elmas::AssemblyBillOfMaterialMaterial.new(assembled_item: "AssembledItem", part_item: "PartItem")
    expect(assembly_bill_of_material_material.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    assembly_bill_of_material_material = Elmas::AssemblyBillOfMaterialMaterial.new
    expect(assembly_bill_of_material_material.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::AssemblyBillOfMaterialMaterial.new(id: "12abcdef-1234-1234-1234-123456abcdef", update_cost_price: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialMaterials(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialMaterials?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialMaterials?$filter=UpdateCostPrice eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:update_cost_price, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialMaterials?$orderby=UpdateCostPrice&$filter=UpdateCostPrice eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:update_cost_price, :id], order_by: :update_cost_price)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialMaterials?$orderby=UpdateCostPrice")
      resource.find_all(order_by: :update_cost_price)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialMaterials?$select=UpdateCostPrice")
      resource.find_all(select: [:update_cost_price])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialMaterials?$select=UpdateCostPrice")
      resource.find_by(select: [:update_cost_price])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialMaterials?$select=UpdateCostPrice,ID")
      resource.find_all(select: [:update_cost_price, :id])
    end
  end
end
