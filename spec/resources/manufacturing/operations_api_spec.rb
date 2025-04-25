require 'spec_helper'

describe Elmas::Operation do
  it "can initialize" do
    operation = Elmas::Operation.new
    expect(operation).to be_a(Elmas::Operation)
  end

  it "accepts attribute setter" do
    operation = Elmas::Operation.new
    operation.modifier_full_name = "78238"
    expect(operation.modifier_full_name).to eq "78238"
  end

  it "returns value for getters" do
    operation = Elmas::Operation.new({ "ModifierFullName" => "345" })
    expect(operation.modifier_full_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    operation = Elmas::Operation.new({ this_does_not_exist: "Piet" })
    expect(operation.try(:modifier_full_name)).to eq nil
  end

  it "is valid with mandatory attributes" do
    operation = Elmas::Operation.new(code: "Code", description: "Description")
    expect(operation.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    operation = Elmas::Operation.new
    expect(operation.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::Operation.new(id: "12abcdef-1234-1234-1234-123456abcdef", modifier_full_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/Operations(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/Operations?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/Operations?$filter=ModifierFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier_full_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/Operations?$orderby=ModifierFullName&$filter=ModifierFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier_full_name, :id], order_by: :modifier_full_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/Operations?$orderby=ModifierFullName")
      resource.find_all(order_by: :modifier_full_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/Operations?$select=ModifierFullName")
      resource.find_all(select: [:modifier_full_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/Operations?$select=ModifierFullName")
      resource.find_by(select: [:modifier_full_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/Operations?$select=ModifierFullName,ID")
      resource.find_all(select: [:modifier_full_name, :id])
    end
  end
end
