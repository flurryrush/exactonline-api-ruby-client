require 'spec_helper'

describe Elmas::RecentHour do
  it "can initialize" do
    recent_hour = Elmas::RecentHour.new
    expect(recent_hour).to be_a(Elmas::RecentHour)
  end

  it "accepts attribute setter" do
    recent_hour = Elmas::RecentHour.new
    recent_hour.item_id = "78238"
    expect(recent_hour.item_id).to eq "78238"
  end

  it "returns value for getters" do
    recent_hour = Elmas::RecentHour.new({ "ItemID" => "345" })
    expect(recent_hour.item_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    recent_hour = Elmas::RecentHour.new({ this_does_not_exist: "Piet" })
    expect(recent_hour.try(:item_id)).to eq nil
  end



  let(:resource) { resource = Elmas::RecentHour.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/RecentHours(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/RecentHours?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/RecentHours?$filter=ItemID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/RecentHours?$orderby=ItemID&$filter=ItemID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_id, :id], order_by: :item_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/RecentHours?$orderby=ItemID")
      resource.find_all(order_by: :item_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/RecentHours?$select=ItemID")
      resource.find_all(select: [:item_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/RecentHours?$select=ItemID")
      resource.find_by(select: [:item_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/RecentHours?$select=ItemID,ID")
      resource.find_all(select: [:item_id, :id])
    end
  end
end
