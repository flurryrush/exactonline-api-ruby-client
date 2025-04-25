require 'spec_helper'

describe Elmas::ItemChargeRelation do
  it "can initialize" do
    item_charge_relation = Elmas::ItemChargeRelation.new
    expect(item_charge_relation).to be_a(Elmas::ItemChargeRelation)
  end

  it "accepts attribute setter" do
    item_charge_relation = Elmas::ItemChargeRelation.new
    item_charge_relation.creator = "78238"
    expect(item_charge_relation.creator).to eq "78238"
  end

  it "returns value for getters" do
    item_charge_relation = Elmas::ItemChargeRelation.new({ "Creator" => "345" })
    expect(item_charge_relation.creator).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    item_charge_relation = Elmas::ItemChargeRelation.new({ this_does_not_exist: "Piet" })
    expect(item_charge_relation.try(:creator)).to eq nil
  end



  let(:resource) { resource = Elmas::ItemChargeRelation.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("logistics/ItemChargeRelation(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("logistics/ItemChargeRelation?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("logistics/ItemChargeRelation?$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("logistics/ItemChargeRelation?$orderby=Creator&$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id], order_by: :creator)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("logistics/ItemChargeRelation?$orderby=Creator")
      resource.find_all(order_by: :creator)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/ItemChargeRelation?$select=Creator")
      resource.find_all(select: [:creator])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("logistics/ItemChargeRelation?$select=Creator")
      resource.find_by(select: [:creator])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/ItemChargeRelation?$select=Creator,ID")
      resource.find_all(select: [:creator, :id])
    end
  end
end
