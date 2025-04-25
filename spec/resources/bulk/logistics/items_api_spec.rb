require 'spec_helper'

describe Elmas::BulkLogisticsItem do
  it "can initialize" do
    bulk_logistics_item = Elmas::BulkLogisticsItem.new
    expect(bulk_logistics_item).to be_a(Elmas::BulkLogisticsItem)
  end

  it "accepts attribute setter" do
    bulk_logistics_item = Elmas::BulkLogisticsItem.new
    bulk_logistics_item.free_text_field_09 = "78238"
    expect(bulk_logistics_item.free_text_field_09).to eq "78238"
  end

  it "returns value for getters" do
    bulk_logistics_item = Elmas::BulkLogisticsItem.new({ "FreeTextField09" => "345" })
    expect(bulk_logistics_item.free_text_field_09).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_logistics_item = Elmas::BulkLogisticsItem.new({ this_does_not_exist: "Piet" })
    expect(bulk_logistics_item.try(:free_text_field_09)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_logistics_item = Elmas::BulkLogisticsItem.new(code: "Code", description: "Description")
    expect(bulk_logistics_item.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_logistics_item = Elmas::BulkLogisticsItem.new
    expect(bulk_logistics_item.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkLogisticsItem.new(id: "12abcdef-1234-1234-1234-123456abcdef", free_text_field_09: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/Logistics/Items(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/Logistics/Items?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/Logistics/Items?$filter=FreeTextField09 eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:free_text_field_09, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/Logistics/Items?$orderby=FreeTextField09&$filter=FreeTextField09 eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:free_text_field_09, :id], order_by: :free_text_field_09)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/Logistics/Items?$orderby=FreeTextField09")
      resource.find_all(order_by: :free_text_field_09)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Logistics/Items?$select=FreeTextField09")
      resource.find_all(select: [:free_text_field_09])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/Logistics/Items?$select=FreeTextField09")
      resource.find_by(select: [:free_text_field_09])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Logistics/Items?$select=FreeTextField09,ID")
      resource.find_all(select: [:free_text_field_09, :id])
    end
  end
end
