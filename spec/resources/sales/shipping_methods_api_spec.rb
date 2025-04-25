require 'spec_helper'

describe Elmas::ShippingMethod do
  it "can initialize" do
    shipping_method = Elmas::ShippingMethod.new
    expect(shipping_method).to be_a(Elmas::ShippingMethod)
  end

  it "accepts attribute setter" do
    shipping_method = Elmas::ShippingMethod.new
    shipping_method.tracking_url = "78238"
    expect(shipping_method.tracking_url).to eq "78238"
  end

  it "returns value for getters" do
    shipping_method = Elmas::ShippingMethod.new({ "TrackingUrl" => "345" })
    expect(shipping_method.tracking_url).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    shipping_method = Elmas::ShippingMethod.new({ this_does_not_exist: "Piet" })
    expect(shipping_method.try(:tracking_url)).to eq nil
  end



  let(:resource) { resource = Elmas::ShippingMethod.new(id: "12abcdef-1234-1234-1234-123456abcdef", tracking_url: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sales/ShippingMethods(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sales/ShippingMethods?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sales/ShippingMethods?$filter=TrackingUrl eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:tracking_url, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sales/ShippingMethods?$orderby=TrackingUrl&$filter=TrackingUrl eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:tracking_url, :id], order_by: :tracking_url)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sales/ShippingMethods?$orderby=TrackingUrl")
      resource.find_all(order_by: :tracking_url)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sales/ShippingMethods?$select=TrackingUrl")
      resource.find_all(select: [:tracking_url])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sales/ShippingMethods?$select=TrackingUrl")
      resource.find_by(select: [:tracking_url])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sales/ShippingMethods?$select=TrackingUrl,ID")
      resource.find_all(select: [:tracking_url, :id])
    end
  end
end
