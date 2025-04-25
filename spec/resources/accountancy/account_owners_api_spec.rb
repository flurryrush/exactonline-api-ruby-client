require 'spec_helper'

describe Elmas::AccountOwner do
  it "can initialize" do
    account_owner = Elmas::AccountOwner.new
    expect(account_owner).to be_a(Elmas::AccountOwner)
  end

  it "accepts attribute setter" do
    account_owner = Elmas::AccountOwner.new
    account_owner.creator_full_name = "78238"
    expect(account_owner.creator_full_name).to eq "78238"
  end

  it "returns value for getters" do
    account_owner = Elmas::AccountOwner.new({ "CreatorFullName" => "345" })
    expect(account_owner.creator_full_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    account_owner = Elmas::AccountOwner.new({ this_does_not_exist: "Piet" })
    expect(account_owner.try(:creator_full_name)).to eq nil
  end



  let(:resource) { resource = Elmas::AccountOwner.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator_full_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("accountancy/AccountOwners(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("accountancy/AccountOwners?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("accountancy/AccountOwners?$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("accountancy/AccountOwners?$orderby=CreatorFullName&$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id], order_by: :creator_full_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("accountancy/AccountOwners?$orderby=CreatorFullName")
      resource.find_all(order_by: :creator_full_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("accountancy/AccountOwners?$select=CreatorFullName")
      resource.find_all(select: [:creator_full_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("accountancy/AccountOwners?$select=CreatorFullName")
      resource.find_by(select: [:creator_full_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("accountancy/AccountOwners?$select=CreatorFullName,ID")
      resource.find_all(select: [:creator_full_name, :id])
    end
  end
end
