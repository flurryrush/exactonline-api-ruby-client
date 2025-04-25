require 'spec_helper'

describe Elmas::OperationResource do
  it "can initialize" do
    operation_resource = Elmas::OperationResource.new
    expect(operation_resource).to be_a(Elmas::OperationResource)
  end

  it "accepts attribute setter" do
    operation_resource = Elmas::OperationResource.new
    operation_resource.purchase_unit = "78238"
    expect(operation_resource.purchase_unit).to eq "78238"
  end

  it "returns value for getters" do
    operation_resource = Elmas::OperationResource.new({ "PurchaseUnit" => "345" })
    expect(operation_resource.purchase_unit).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    operation_resource = Elmas::OperationResource.new({ this_does_not_exist: "Piet" })
    expect(operation_resource.try(:purchase_unit)).to eq nil
  end

  it "is valid with mandatory attributes" do
    operation_resource = Elmas::OperationResource.new(operation: "Operation")
    expect(operation_resource.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    operation_resource = Elmas::OperationResource.new
    expect(operation_resource.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::OperationResource.new(id: "12abcdef-1234-1234-1234-123456abcdef", purchase_unit: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/OperationResources(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/OperationResources?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/OperationResources?$filter=PurchaseUnit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:purchase_unit, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/OperationResources?$orderby=PurchaseUnit&$filter=PurchaseUnit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:purchase_unit, :id], order_by: :purchase_unit)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/OperationResources?$orderby=PurchaseUnit")
      resource.find_all(order_by: :purchase_unit)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/OperationResources?$select=PurchaseUnit")
      resource.find_all(select: [:purchase_unit])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/OperationResources?$select=PurchaseUnit")
      resource.find_by(select: [:purchase_unit])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/OperationResources?$select=PurchaseUnit,ID")
      resource.find_all(select: [:purchase_unit, :id])
    end
  end
end
