require 'spec_helper'

describe Elmas::ItemAssortment do
  it "can initialize" do
    item_assortment = Elmas::ItemAssortment.new
    expect(item_assortment).to be_a(Elmas::ItemAssortment)
  end

  it "accepts attribute setter" do
    item_assortment = Elmas::ItemAssortment.new
    item_assortment.properties = "78238"
    expect(item_assortment.properties).to eq "78238"
  end

  it "returns value for getters" do
    item_assortment = Elmas::ItemAssortment.new({ "Properties" => "345" })
    expect(item_assortment.properties).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    item_assortment = Elmas::ItemAssortment.new({ this_does_not_exist: "Piet" })
    expect(item_assortment.try(:properties)).to eq nil
  end



  let(:resource) { resource = Elmas::ItemAssortment.new(id: "12abcdef-1234-1234-1234-123456abcdef", properties: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("logistics/ItemAssortment(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("logistics/ItemAssortment?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("logistics/ItemAssortment?$filter=Properties eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:properties, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("logistics/ItemAssortment?$orderby=Properties&$filter=Properties eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:properties, :id], order_by: :properties)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("logistics/ItemAssortment?$orderby=Properties")
      resource.find_all(order_by: :properties)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/ItemAssortment?$select=Properties")
      resource.find_all(select: [:properties])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("logistics/ItemAssortment?$select=Properties")
      resource.find_by(select: [:properties])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/ItemAssortment?$select=Properties,ID")
      resource.find_all(select: [:properties, :id])
    end
  end
end
