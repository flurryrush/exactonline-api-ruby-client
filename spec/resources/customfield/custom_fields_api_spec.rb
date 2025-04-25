require 'spec_helper'

describe Elmas::CustomField do
  it "can initialize" do
    custom_field = Elmas::CustomField.new
    expect(custom_field).to be_a(Elmas::CustomField)
  end

  it "accepts attribute setter" do
    custom_field = Elmas::CustomField.new
    custom_field.caption = "78238"
    expect(custom_field.caption).to eq "78238"
  end

  it "returns value for getters" do
    custom_field = Elmas::CustomField.new({ "Caption" => "345" })
    expect(custom_field.caption).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    custom_field = Elmas::CustomField.new({ this_does_not_exist: "Piet" })
    expect(custom_field.try(:caption)).to eq nil
  end

  it "is valid with mandatory attributes" do
    custom_field = Elmas::CustomField.new(link_id: "LinkID", business_component_name: "BusinessComponentName", property_name: "PropertyName", value: "Value")
    expect(custom_field.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    custom_field = Elmas::CustomField.new
    expect(custom_field.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::CustomField.new(id: "12abcdef-1234-1234-1234-123456abcdef", caption: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("customfield/CustomFields(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("customfield/CustomFields?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("customfield/CustomFields?$filter=Caption eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:caption, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("customfield/CustomFields?$orderby=Caption&$filter=Caption eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:caption, :id], order_by: :caption)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("customfield/CustomFields?$orderby=Caption")
      resource.find_all(order_by: :caption)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("customfield/CustomFields?$select=Caption")
      resource.find_all(select: [:caption])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("customfield/CustomFields?$select=Caption")
      resource.find_by(select: [:caption])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("customfield/CustomFields?$select=Caption,ID")
      resource.find_all(select: [:caption, :id])
    end
  end
end
