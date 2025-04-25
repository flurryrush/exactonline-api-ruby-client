require 'spec_helper'

describe Elmas::TimeAndBillingProjectDetail do
  it "can initialize" do
    time_and_billing_project_detail = Elmas::TimeAndBillingProjectDetail.new
    expect(time_and_billing_project_detail).to be_a(Elmas::TimeAndBillingProjectDetail)
  end

  it "accepts attribute setter" do
    time_and_billing_project_detail = Elmas::TimeAndBillingProjectDetail.new
    time_and_billing_project_detail.code = "78238"
    expect(time_and_billing_project_detail.code).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_project_detail = Elmas::TimeAndBillingProjectDetail.new({ "Code" => "345" })
    expect(time_and_billing_project_detail.code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_project_detail = Elmas::TimeAndBillingProjectDetail.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_project_detail.try(:code)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingProjectDetail.new(id: "12abcdef-1234-1234-1234-123456abcdef", code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetails(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetails?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetails?$filter=Code eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetails?$orderby=Code&$filter=Code eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:code, :id], order_by: :code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetails?$orderby=Code")
      resource.find_all(order_by: :code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetails?$select=Code")
      resource.find_all(select: [:code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetails?$select=Code")
      resource.find_by(select: [:code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingProjectDetails?$select=Code,ID")
      resource.find_all(select: [:code, :id])
    end
  end
end
