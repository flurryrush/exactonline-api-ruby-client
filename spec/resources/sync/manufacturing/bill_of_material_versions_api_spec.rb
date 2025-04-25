require 'spec_helper'

describe Elmas::SyncManufacturingBillOfMaterialVersion do
  it "can initialize" do
    sync_manufacturing_bill_of_material_version = Elmas::SyncManufacturingBillOfMaterialVersion.new
    expect(sync_manufacturing_bill_of_material_version).to be_a(Elmas::SyncManufacturingBillOfMaterialVersion)
  end

  it "accepts attribute setter" do
    sync_manufacturing_bill_of_material_version = Elmas::SyncManufacturingBillOfMaterialVersion.new
    sync_manufacturing_bill_of_material_version.modifier = "78238"
    expect(sync_manufacturing_bill_of_material_version.modifier).to eq "78238"
  end

  it "returns value for getters" do
    sync_manufacturing_bill_of_material_version = Elmas::SyncManufacturingBillOfMaterialVersion.new({ "Modifier" => "345" })
    expect(sync_manufacturing_bill_of_material_version.modifier).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_manufacturing_bill_of_material_version = Elmas::SyncManufacturingBillOfMaterialVersion.new({ this_does_not_exist: "Piet" })
    expect(sync_manufacturing_bill_of_material_version.try(:modifier)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_manufacturing_bill_of_material_version = Elmas::SyncManufacturingBillOfMaterialVersion.new(description: "Description", item: "Item", order_lead_days: "OrderLeadDays")
    expect(sync_manufacturing_bill_of_material_version.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_manufacturing_bill_of_material_version = Elmas::SyncManufacturingBillOfMaterialVersion.new
    expect(sync_manufacturing_bill_of_material_version.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncManufacturingBillOfMaterialVersion.new(id: "12abcdef-1234-1234-1234-123456abcdef", modifier: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialVersions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialVersions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialVersions?$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialVersions?$orderby=Modifier&$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id], order_by: :modifier)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialVersions?$orderby=Modifier")
      resource.find_all(order_by: :modifier)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialVersions?$select=Modifier")
      resource.find_all(select: [:modifier])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialVersions?$select=Modifier")
      resource.find_by(select: [:modifier])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Manufacturing/BillOfMaterialVersions?$select=Modifier,ID")
      resource.find_all(select: [:modifier, :id])
    end
  end
end
