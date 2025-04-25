require 'spec_helper'

describe Elmas::SalesChannel do
  it "can initialize" do
    sales_channel = Elmas::SalesChannel.new
    expect(sales_channel).to be_a(Elmas::SalesChannel)
  end

  it "accepts attribute setter" do
    sales_channel = Elmas::SalesChannel.new
    sales_channel.active = "78238"
    expect(sales_channel.active).to eq "78238"
  end

  it "returns value for getters" do
    sales_channel = Elmas::SalesChannel.new({ "Active" => "345" })
    expect(sales_channel.active).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sales_channel = Elmas::SalesChannel.new({ this_does_not_exist: "Piet" })
    expect(sales_channel.try(:active)).to eq nil
  end



  let(:resource) { resource = Elmas::SalesChannel.new(id: "12abcdef-1234-1234-1234-123456abcdef", active: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sales/SalesChannels(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sales/SalesChannels?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sales/SalesChannels?$filter=Active eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:active, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sales/SalesChannels?$orderby=Active&$filter=Active eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:active, :id], order_by: :active)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sales/SalesChannels?$orderby=Active")
      resource.find_all(order_by: :active)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sales/SalesChannels?$select=Active")
      resource.find_all(select: [:active])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sales/SalesChannels?$select=Active")
      resource.find_by(select: [:active])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sales/SalesChannels?$select=Active,ID")
      resource.find_all(select: [:active, :id])
    end
  end
end
