require 'spec_helper'

describe Elmas::HourTypesByDate do
  it "can initialize" do
    hour_types_by_date = Elmas::HourTypesByDate.new
    expect(hour_types_by_date).to be_a(Elmas::HourTypesByDate)
  end

  it "accepts attribute setter" do
    hour_types_by_date = Elmas::HourTypesByDate.new
    hour_types_by_date.item_id = "78238"
    expect(hour_types_by_date.item_id).to eq "78238"
  end

  it "returns value for getters" do
    hour_types_by_date = Elmas::HourTypesByDate.new({ "ItemID" => "345" })
    expect(hour_types_by_date.item_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    hour_types_by_date = Elmas::HourTypesByDate.new({ this_does_not_exist: "Piet" })
    expect(hour_types_by_date.try(:item_id)).to eq nil
  end



  let(:resource) { resource = Elmas::HourTypesByDate.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/HourTypesByDate(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/HourTypesByDate?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/HourTypesByDate?$filter=ItemID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/HourTypesByDate?$orderby=ItemID&$filter=ItemID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_id, :id], order_by: :item_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/HourTypesByDate?$orderby=ItemID")
      resource.find_all(order_by: :item_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HourTypesByDate?$select=ItemID")
      resource.find_all(select: [:item_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/HourTypesByDate?$select=ItemID")
      resource.find_by(select: [:item_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HourTypesByDate?$select=ItemID,ID")
      resource.find_all(select: [:item_id, :id])
    end
  end
end
