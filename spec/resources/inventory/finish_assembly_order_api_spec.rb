require 'spec_helper'

describe Elmas::FinishAssemblyOrder do
  it "can initialize" do
    finish_assembly_order = Elmas::FinishAssemblyOrder.new
    expect(finish_assembly_order).to be_a(Elmas::FinishAssemblyOrder)
  end

  it "accepts attribute setter" do
    finish_assembly_order = Elmas::FinishAssemblyOrder.new
    finish_assembly_order.description = "78238"
    expect(finish_assembly_order.description).to eq "78238"
  end

  it "returns value for getters" do
    finish_assembly_order = Elmas::FinishAssemblyOrder.new({ "Description" => "345" })
    expect(finish_assembly_order.description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    finish_assembly_order = Elmas::FinishAssemblyOrder.new({ this_does_not_exist: "Piet" })
    expect(finish_assembly_order.try(:description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    finish_assembly_order = Elmas::FinishAssemblyOrder.new(assembly_order: "AssemblyOrder", finish_order_quantity: "FinishOrderQuantity")
    expect(finish_assembly_order.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    finish_assembly_order = Elmas::FinishAssemblyOrder.new
    expect(finish_assembly_order.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::FinishAssemblyOrder.new(id: "12abcdef-1234-1234-1234-123456abcdef", description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/FinishAssemblyOrder(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/FinishAssemblyOrder?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/FinishAssemblyOrder?$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/FinishAssemblyOrder?$orderby=Description&$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id], order_by: :description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/FinishAssemblyOrder?$orderby=Description")
      resource.find_all(order_by: :description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/FinishAssemblyOrder?$select=Description")
      resource.find_all(select: [:description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/FinishAssemblyOrder?$select=Description")
      resource.find_by(select: [:description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/FinishAssemblyOrder?$select=Description,ID")
      resource.find_all(select: [:description, :id])
    end
  end
end
