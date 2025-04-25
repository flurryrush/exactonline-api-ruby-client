require 'spec_helper'

describe Elmas::Asset do
  it "can initialize" do
    asset = Elmas::Asset.new
    expect(asset).to be_a(Elmas::Asset)
  end

  it "accepts attribute setter" do
    asset = Elmas::Asset.new
    asset.primary_method_description = "78238"
    expect(asset.primary_method_description).to eq "78238"
  end

  it "returns value for getters" do
    asset = Elmas::Asset.new({ "PrimaryMethodDescription" => "345" })
    expect(asset.primary_method_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    asset = Elmas::Asset.new({ this_does_not_exist: "Piet" })
    expect(asset.try(:primary_method_description)).to eq nil
  end



  let(:resource) { resource = Elmas::Asset.new(id: "12abcdef-1234-1234-1234-123456abcdef", primary_method_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("assets/Assets(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("assets/Assets?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("assets/Assets?$filter=PrimaryMethodDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:primary_method_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("assets/Assets?$orderby=PrimaryMethodDescription&$filter=PrimaryMethodDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:primary_method_description, :id], order_by: :primary_method_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("assets/Assets?$orderby=PrimaryMethodDescription")
      resource.find_all(order_by: :primary_method_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("assets/Assets?$select=PrimaryMethodDescription")
      resource.find_all(select: [:primary_method_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("assets/Assets?$select=PrimaryMethodDescription")
      resource.find_by(select: [:primary_method_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("assets/Assets?$select=PrimaryMethodDescription,ID")
      resource.find_all(select: [:primary_method_description, :id])
    end
  end
end
