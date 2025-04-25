require 'spec_helper'

describe Elmas::ItemVersion do
  it "can initialize" do
    item_version = Elmas::ItemVersion.new
    expect(item_version).to be_a(Elmas::ItemVersion)
  end

  it "accepts attribute setter" do
    item_version = Elmas::ItemVersion.new
    item_version.item_description = "78238"
    expect(item_version.item_description).to eq "78238"
  end

  it "returns value for getters" do
    item_version = Elmas::ItemVersion.new({ "ItemDescription" => "345" })
    expect(item_version.item_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    item_version = Elmas::ItemVersion.new({ this_does_not_exist: "Piet" })
    expect(item_version.try(:item_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    item_version = Elmas::ItemVersion.new(description: "Description", item: "Item")
    expect(item_version.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    item_version = Elmas::ItemVersion.new
    expect(item_version.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ItemVersion.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("logistics/ItemVersions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("logistics/ItemVersions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("logistics/ItemVersions?$filter=ItemDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("logistics/ItemVersions?$orderby=ItemDescription&$filter=ItemDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_description, :id], order_by: :item_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("logistics/ItemVersions?$orderby=ItemDescription")
      resource.find_all(order_by: :item_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/ItemVersions?$select=ItemDescription")
      resource.find_all(select: [:item_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("logistics/ItemVersions?$select=ItemDescription")
      resource.find_by(select: [:item_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/ItemVersions?$select=ItemDescription,ID")
      resource.find_all(select: [:item_description, :id])
    end
  end
end
