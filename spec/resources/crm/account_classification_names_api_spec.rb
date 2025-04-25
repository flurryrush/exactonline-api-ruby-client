require 'spec_helper'

describe Elmas::AccountClassificationName do
  it "can initialize" do
    account_classification_name = Elmas::AccountClassificationName.new
    expect(account_classification_name).to be_a(Elmas::AccountClassificationName)
  end

  it "accepts attribute setter" do
    account_classification_name = Elmas::AccountClassificationName.new
    account_classification_name.creator_full_name = "78238"
    expect(account_classification_name.creator_full_name).to eq "78238"
  end

  it "returns value for getters" do
    account_classification_name = Elmas::AccountClassificationName.new({ "CreatorFullName" => "345" })
    expect(account_classification_name.creator_full_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    account_classification_name = Elmas::AccountClassificationName.new({ this_does_not_exist: "Piet" })
    expect(account_classification_name.try(:creator_full_name)).to eq nil
  end



  let(:resource) { resource = Elmas::AccountClassificationName.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator_full_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/AccountClassificationNames(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/AccountClassificationNames?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/AccountClassificationNames?$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/AccountClassificationNames?$orderby=CreatorFullName&$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id], order_by: :creator_full_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/AccountClassificationNames?$orderby=CreatorFullName")
      resource.find_all(order_by: :creator_full_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/AccountClassificationNames?$select=CreatorFullName")
      resource.find_all(select: [:creator_full_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/AccountClassificationNames?$select=CreatorFullName")
      resource.find_by(select: [:creator_full_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/AccountClassificationNames?$select=CreatorFullName,ID")
      resource.find_all(select: [:creator_full_name, :id])
    end
  end
end
