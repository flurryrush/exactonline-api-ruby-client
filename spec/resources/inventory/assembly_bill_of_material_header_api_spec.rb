require 'spec_helper'

describe Elmas::AssemblyBillOfMaterialHeader do
  it "can initialize" do
    assembly_bill_of_material_header = Elmas::AssemblyBillOfMaterialHeader.new
    expect(assembly_bill_of_material_header).to be_a(Elmas::AssemblyBillOfMaterialHeader)
  end

  it "accepts attribute setter" do
    assembly_bill_of_material_header = Elmas::AssemblyBillOfMaterialHeader.new
    assembly_bill_of_material_header.batch_quantity = "78238"
    expect(assembly_bill_of_material_header.batch_quantity).to eq "78238"
  end

  it "returns value for getters" do
    assembly_bill_of_material_header = Elmas::AssemblyBillOfMaterialHeader.new({ "BatchQuantity" => "345" })
    expect(assembly_bill_of_material_header.batch_quantity).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    assembly_bill_of_material_header = Elmas::AssemblyBillOfMaterialHeader.new({ this_does_not_exist: "Piet" })
    expect(assembly_bill_of_material_header.try(:batch_quantity)).to eq nil
  end

  it "is valid with mandatory attributes" do
    assembly_bill_of_material_header = Elmas::AssemblyBillOfMaterialHeader.new(assembly_bill_of_material_materials: "AssemblyBillOfMaterialMaterials")
    expect(assembly_bill_of_material_header.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    assembly_bill_of_material_header = Elmas::AssemblyBillOfMaterialHeader.new
    expect(assembly_bill_of_material_header.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::AssemblyBillOfMaterialHeader.new(id: "12abcdef-1234-1234-1234-123456abcdef", batch_quantity: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialHeader(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialHeader?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialHeader?$filter=BatchQuantity eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:batch_quantity, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialHeader?$orderby=BatchQuantity&$filter=BatchQuantity eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:batch_quantity, :id], order_by: :batch_quantity)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialHeader?$orderby=BatchQuantity")
      resource.find_all(order_by: :batch_quantity)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialHeader?$select=BatchQuantity")
      resource.find_all(select: [:batch_quantity])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialHeader?$select=BatchQuantity")
      resource.find_by(select: [:batch_quantity])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyBillOfMaterialHeader?$select=BatchQuantity,ID")
      resource.find_all(select: [:batch_quantity, :id])
    end
  end
end
