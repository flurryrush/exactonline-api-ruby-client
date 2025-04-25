require 'spec_helper'

describe Elmas::ItemExtraField do
  it "can initialize" do
    item_extra_field = Elmas::ItemExtraField.new
    expect(item_extra_field).to be_a(Elmas::ItemExtraField)
  end

  it "accepts attribute setter" do
    item_extra_field = Elmas::ItemExtraField.new
    item_extra_field.value = "78238"
    expect(item_extra_field.value).to eq "78238"
  end

  it "returns value for getters" do
    item_extra_field = Elmas::ItemExtraField.new({ "Value" => "345" })
    expect(item_extra_field.value).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    item_extra_field = Elmas::ItemExtraField.new({ this_does_not_exist: "Piet" })
    expect(item_extra_field.try(:value)).to eq nil
  end



  let(:resource) { resource = Elmas::ItemExtraField.new(id: "12abcdef-1234-1234-1234-123456abcdef", value: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/logistics/ItemExtraField(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/logistics/ItemExtraField?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/logistics/ItemExtraField?$filter=Value eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:value, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/logistics/ItemExtraField?$orderby=Value&$filter=Value eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:value, :id], order_by: :value)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/logistics/ItemExtraField?$orderby=Value")
      resource.find_all(order_by: :value)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/logistics/ItemExtraField?$select=Value")
      resource.find_all(select: [:value])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/logistics/ItemExtraField?$select=Value")
      resource.find_by(select: [:value])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/logistics/ItemExtraField?$select=Value,ID")
      resource.find_all(select: [:value, :id])
    end
  end
end
