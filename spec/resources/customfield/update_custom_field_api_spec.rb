require 'spec_helper'

describe Elmas::UpdateCustomField do
  it "can initialize" do
    update_custom_field = Elmas::UpdateCustomField.new
    expect(update_custom_field).to be_a(Elmas::UpdateCustomField)
  end

  it "accepts attribute setter" do
    update_custom_field = Elmas::UpdateCustomField.new
    update_custom_field.type = "78238"
    expect(update_custom_field.type).to eq "78238"
  end

  it "returns value for getters" do
    update_custom_field = Elmas::UpdateCustomField.new({ "Type" => "345" })
    expect(update_custom_field.type).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    update_custom_field = Elmas::UpdateCustomField.new({ this_does_not_exist: "Piet" })
    expect(update_custom_field.try(:type)).to eq nil
  end

  it "is valid with mandatory attributes" do
    update_custom_field = Elmas::UpdateCustomField.new(link_id: "LinkID", business_component_name: "BusinessComponentName", property_name: "PropertyName", value: "Value")
    expect(update_custom_field.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    update_custom_field = Elmas::UpdateCustomField.new
    expect(update_custom_field.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::UpdateCustomField.new(id: "12abcdef-1234-1234-1234-123456abcdef", type: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("customfield/UpdateCustomField(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("customfield/UpdateCustomField?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("customfield/UpdateCustomField?$filter=Type eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("customfield/UpdateCustomField?$orderby=Type&$filter=Type eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type, :id], order_by: :type)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("customfield/UpdateCustomField?$orderby=Type")
      resource.find_all(order_by: :type)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("customfield/UpdateCustomField?$select=Type")
      resource.find_all(select: [:type])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("customfield/UpdateCustomField?$select=Type")
      resource.find_by(select: [:type])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("customfield/UpdateCustomField?$select=Type,ID")
      resource.find_all(select: [:type, :id])
    end
  end
end
