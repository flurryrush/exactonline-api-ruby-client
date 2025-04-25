require 'spec_helper'

describe Elmas::ManufacturingSetting do
  it "can initialize" do
    manufacturing_setting = Elmas::ManufacturingSetting.new
    expect(manufacturing_setting).to be_a(Elmas::ManufacturingSetting)
  end

  it "accepts attribute setter" do
    manufacturing_setting = Elmas::ManufacturingSetting.new
    manufacturing_setting.inventory_main_method = "78238"
    expect(manufacturing_setting.inventory_main_method).to eq "78238"
  end

  it "returns value for getters" do
    manufacturing_setting = Elmas::ManufacturingSetting.new({ "InventoryMainMethod" => "345" })
    expect(manufacturing_setting.inventory_main_method).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    manufacturing_setting = Elmas::ManufacturingSetting.new({ this_does_not_exist: "Piet" })
    expect(manufacturing_setting.try(:inventory_main_method)).to eq nil
  end



  let(:resource) { resource = Elmas::ManufacturingSetting.new(id: "12abcdef-1234-1234-1234-123456abcdef", inventory_main_method: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/ManufacturingSettings(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/ManufacturingSettings?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ManufacturingSettings?$filter=InventoryMainMethod eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:inventory_main_method, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/ManufacturingSettings?$orderby=InventoryMainMethod&$filter=InventoryMainMethod eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:inventory_main_method, :id], order_by: :inventory_main_method)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/ManufacturingSettings?$orderby=InventoryMainMethod")
      resource.find_all(order_by: :inventory_main_method)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ManufacturingSettings?$select=InventoryMainMethod")
      resource.find_all(select: [:inventory_main_method])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/ManufacturingSettings?$select=InventoryMainMethod")
      resource.find_by(select: [:inventory_main_method])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/ManufacturingSettings?$select=InventoryMainMethod,ID")
      resource.find_all(select: [:inventory_main_method, :id])
    end
  end
end
