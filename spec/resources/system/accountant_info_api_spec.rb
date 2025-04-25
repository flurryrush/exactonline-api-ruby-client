require 'spec_helper'

describe Elmas::AccountantInfo do
  it "can initialize" do
    accountant_info = Elmas::AccountantInfo.new
    expect(accountant_info).to be_a(Elmas::AccountantInfo)
  end

  it "accepts attribute setter" do
    accountant_info = Elmas::AccountantInfo.new
    accountant_info.is_accountant = "78238"
    expect(accountant_info.is_accountant).to eq "78238"
  end

  it "returns value for getters" do
    accountant_info = Elmas::AccountantInfo.new({ "IsAccountant" => "345" })
    expect(accountant_info.is_accountant).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    accountant_info = Elmas::AccountantInfo.new({ this_does_not_exist: "Piet" })
    expect(accountant_info.try(:is_accountant)).to eq nil
  end



  let(:resource) { resource = Elmas::AccountantInfo.new(id: "12abcdef-1234-1234-1234-123456abcdef", is_accountant: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("system/AccountantInfo(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("system/AccountantInfo?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("system/AccountantInfo?$filter=IsAccountant eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_accountant, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("system/AccountantInfo?$orderby=IsAccountant&$filter=IsAccountant eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_accountant, :id], order_by: :is_accountant)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("system/AccountantInfo?$orderby=IsAccountant")
      resource.find_all(order_by: :is_accountant)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("system/AccountantInfo?$select=IsAccountant")
      resource.find_all(select: [:is_accountant])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("system/AccountantInfo?$select=IsAccountant")
      resource.find_by(select: [:is_accountant])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("system/AccountantInfo?$select=IsAccountant,ID")
      resource.find_all(select: [:is_accountant, :id])
    end
  end
end
