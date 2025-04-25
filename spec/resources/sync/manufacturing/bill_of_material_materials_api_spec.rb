require 'spec_helper'

describe Elmas::SyncManufacturingBillOfMaterialMaterial do
  it "can initialize" do
    sync_manufacturing_bill_of_material_material = Elmas::SyncManufacturingBillOfMaterialMaterial.new
    expect(sync_manufacturing_bill_of_material_material).to be_a(Elmas::SyncManufacturingBillOfMaterialMaterial)
  end

  it "accepts attribute setter" do
    sync_manufacturing_bill_of_material_material = Elmas::SyncManufacturingBillOfMaterialMaterial.new
    sync_manufacturing_bill_of_material_material.detail_drawing = "78238"
    expect(sync_manufacturing_bill_of_material_material.detail_drawing).to eq "78238"
  end

  it "returns value for getters" do
    sync_manufacturing_bill_of_material_material = Elmas::SyncManufacturingBillOfMaterialMaterial.new({ "DetailDrawing" => "345" })
    expect(sync_manufacturing_bill_of_material_material.detail_drawing).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_manufacturing_bill_of_material_material = Elmas::SyncManufacturingBillOfMaterialMaterial.new({ this_does_not_exist: "Piet" })
    expect(sync_manufacturing_bill_of_material_material.try(:detail_drawing)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_manufacturing_bill_of_material_material = Elmas::SyncManufacturingBillOfMaterialMaterial.new(item_version: "ItemVersion", part_item: "PartItem")
    expect(sync_manufacturing_bill_of_material_material.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_manufacturing_bill_of_material_material = Elmas::SyncManufacturingBillOfMaterialMaterial.new
    expect(sync_manufacturing_bill_of_material_material.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncManufacturingBillOfMaterialMaterial.new(id: "12abcdef-1234-1234-1234-123456abcdef", detail_drawing: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialMaterials(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialMaterials?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialMaterials?$filter=DetailDrawing eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:detail_drawing, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialMaterials?$orderby=DetailDrawing&$filter=DetailDrawing eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:detail_drawing, :id], order_by: :detail_drawing)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialMaterials?$orderby=DetailDrawing")
      resource.find_all(order_by: :detail_drawing)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialMaterials?$select=DetailDrawing")
      resource.find_all(select: [:detail_drawing])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialMaterials?$select=DetailDrawing")
      resource.find_by(select: [:detail_drawing])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialMaterials?$select=DetailDrawing,ID")
      resource.find_all(select: [:detail_drawing, :id])
    end
  end
end
