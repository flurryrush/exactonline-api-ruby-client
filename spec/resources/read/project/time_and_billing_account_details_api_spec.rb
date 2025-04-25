require 'spec_helper'

describe Elmas::TimeAndBillingAccountDetail do
  it "can initialize" do
    time_and_billing_account_detail = Elmas::TimeAndBillingAccountDetail.new
    expect(time_and_billing_account_detail).to be_a(Elmas::TimeAndBillingAccountDetail)
  end

  it "accepts attribute setter" do
    time_and_billing_account_detail = Elmas::TimeAndBillingAccountDetail.new
    time_and_billing_account_detail.name = "78238"
    expect(time_and_billing_account_detail.name).to eq "78238"
  end

  it "returns value for getters" do
    time_and_billing_account_detail = Elmas::TimeAndBillingAccountDetail.new({ "Name" => "345" })
    expect(time_and_billing_account_detail.name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_and_billing_account_detail = Elmas::TimeAndBillingAccountDetail.new({ this_does_not_exist: "Piet" })
    expect(time_and_billing_account_detail.try(:name)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeAndBillingAccountDetail.new(id: "12abcdef-1234-1234-1234-123456abcdef", name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingAccountDetails(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingAccountDetails?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingAccountDetails?$filter=Name eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingAccountDetails?$orderby=Name&$filter=Name eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:name, :id], order_by: :name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/TimeAndBillingAccountDetails?$orderby=Name")
      resource.find_all(order_by: :name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingAccountDetails?$select=Name")
      resource.find_all(select: [:name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingAccountDetails?$select=Name")
      resource.find_by(select: [:name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/TimeAndBillingAccountDetails?$select=Name,ID")
      resource.find_all(select: [:name, :id])
    end
  end
end
