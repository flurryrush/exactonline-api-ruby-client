require 'spec_helper'

describe Elmas::SyncLogisticsItem do
  it "can initialize" do
    sync_logistics_item = Elmas::SyncLogisticsItem.new
    expect(sync_logistics_item).to be_a(Elmas::SyncLogisticsItem)
  end

  it "accepts attribute setter" do
    sync_logistics_item = Elmas::SyncLogisticsItem.new
    sync_logistics_item.creator = "78238"
    expect(sync_logistics_item.creator).to eq "78238"
  end

  it "returns value for getters" do
    sync_logistics_item = Elmas::SyncLogisticsItem.new({ "Creator" => "345" })
    expect(sync_logistics_item.creator).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_logistics_item = Elmas::SyncLogisticsItem.new({ this_does_not_exist: "Piet" })
    expect(sync_logistics_item.try(:creator)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_logistics_item = Elmas::SyncLogisticsItem.new(code: "Code", description: "Description")
    expect(sync_logistics_item.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_logistics_item = Elmas::SyncLogisticsItem.new
    expect(sync_logistics_item.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncLogisticsItem.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Logistics/Items(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Logistics/Items?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Logistics/Items?$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Logistics/Items?$orderby=Creator&$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id], order_by: :creator)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Logistics/Items?$orderby=Creator")
      resource.find_all(order_by: :creator)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Logistics/Items?$select=Creator")
      resource.find_all(select: [:creator])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Logistics/Items?$select=Creator")
      resource.find_by(select: [:creator])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Logistics/Items?$select=Creator,ID")
      resource.find_all(select: [:creator, :id])
    end
  end
end
