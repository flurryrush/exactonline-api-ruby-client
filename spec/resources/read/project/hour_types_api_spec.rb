require 'spec_helper'

describe Elmas::HourType do
  it "can initialize" do
    hour_type = Elmas::HourType.new
    expect(hour_type).to be_a(Elmas::HourType)
  end

  it "accepts attribute setter" do
    hour_type = Elmas::HourType.new
    hour_type.item_code = "78238"
    expect(hour_type.item_code).to eq "78238"
  end

  it "returns value for getters" do
    hour_type = Elmas::HourType.new({ "ItemCode" => "345" })
    expect(hour_type.item_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    hour_type = Elmas::HourType.new({ this_does_not_exist: "Piet" })
    expect(hour_type.try(:item_code)).to eq nil
  end



  let(:resource) { resource = Elmas::HourType.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/HourTypes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/HourTypes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/HourTypes?$filter=ItemCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/HourTypes?$orderby=ItemCode&$filter=ItemCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_code, :id], order_by: :item_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/HourTypes?$orderby=ItemCode")
      resource.find_all(order_by: :item_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HourTypes?$select=ItemCode")
      resource.find_all(select: [:item_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/HourTypes?$select=ItemCode")
      resource.find_by(select: [:item_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HourTypes?$select=ItemCode,ID")
      resource.find_all(select: [:item_code, :id])
    end
  end
end
