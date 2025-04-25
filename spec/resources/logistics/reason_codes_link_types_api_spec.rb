require 'spec_helper'

describe Elmas::ReasonCodesLinkType do
  it "can initialize" do
    reason_codes_link_type = Elmas::ReasonCodesLinkType.new
    expect(reason_codes_link_type).to be_a(Elmas::ReasonCodesLinkType)
  end

  it "accepts attribute setter" do
    reason_codes_link_type = Elmas::ReasonCodesLinkType.new
    reason_codes_link_type.reason = "78238"
    expect(reason_codes_link_type.reason).to eq "78238"
  end

  it "returns value for getters" do
    reason_codes_link_type = Elmas::ReasonCodesLinkType.new({ "Reason" => "345" })
    expect(reason_codes_link_type.reason).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    reason_codes_link_type = Elmas::ReasonCodesLinkType.new({ this_does_not_exist: "Piet" })
    expect(reason_codes_link_type.try(:reason)).to eq nil
  end



  let(:resource) { resource = Elmas::ReasonCodesLinkType.new(id: "12abcdef-1234-1234-1234-123456abcdef", reason: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("logistics/ReasonCodesLinkTypes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("logistics/ReasonCodesLinkTypes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("logistics/ReasonCodesLinkTypes?$filter=Reason eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:reason, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("logistics/ReasonCodesLinkTypes?$orderby=Reason&$filter=Reason eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:reason, :id], order_by: :reason)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("logistics/ReasonCodesLinkTypes?$orderby=Reason")
      resource.find_all(order_by: :reason)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/ReasonCodesLinkTypes?$select=Reason")
      resource.find_all(select: [:reason])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("logistics/ReasonCodesLinkTypes?$select=Reason")
      resource.find_by(select: [:reason])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/ReasonCodesLinkTypes?$select=Reason,ID")
      resource.find_all(select: [:reason, :id])
    end
  end
end
