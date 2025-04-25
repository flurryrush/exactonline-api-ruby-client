require 'spec_helper'

describe Elmas::CRMReasonCode do
  it "can initialize" do
    crm_reason_code = Elmas::CRMReasonCode.new
    expect(crm_reason_code).to be_a(Elmas::CRMReasonCode)
  end

  it "accepts attribute setter" do
    crm_reason_code = Elmas::CRMReasonCode.new
    crm_reason_code.code = "78238"
    expect(crm_reason_code.code).to eq "78238"
  end

  it "returns value for getters" do
    crm_reason_code = Elmas::CRMReasonCode.new({ "Code" => "345" })
    expect(crm_reason_code.code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    crm_reason_code = Elmas::CRMReasonCode.new({ this_does_not_exist: "Piet" })
    expect(crm_reason_code.try(:code)).to eq nil
  end



  let(:resource) { resource = Elmas::CRMReasonCode.new(id: "12abcdef-1234-1234-1234-123456abcdef", code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/ReasonCodes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/ReasonCodes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/ReasonCodes?$filter=Code eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/ReasonCodes?$orderby=Code&$filter=Code eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:code, :id], order_by: :code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/ReasonCodes?$orderby=Code")
      resource.find_all(order_by: :code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/ReasonCodes?$select=Code")
      resource.find_all(select: [:code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/ReasonCodes?$select=Code")
      resource.find_by(select: [:code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/ReasonCodes?$select=Code,ID")
      resource.find_all(select: [:code, :id])
    end
  end
end
