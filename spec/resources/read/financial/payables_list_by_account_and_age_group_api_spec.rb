require 'spec_helper'

describe Elmas::PayablesListByAccountAndAgeGroup do
  it "can initialize" do
    payables_list_by_account_and_age_group = Elmas::PayablesListByAccountAndAgeGroup.new
    expect(payables_list_by_account_and_age_group).to be_a(Elmas::PayablesListByAccountAndAgeGroup)
  end

  it "accepts attribute setter" do
    payables_list_by_account_and_age_group = Elmas::PayablesListByAccountAndAgeGroup.new
    payables_list_by_account_and_age_group.journal_description = "78238"
    expect(payables_list_by_account_and_age_group.journal_description).to eq "78238"
  end

  it "returns value for getters" do
    payables_list_by_account_and_age_group = Elmas::PayablesListByAccountAndAgeGroup.new({ "JournalDescription" => "345" })
    expect(payables_list_by_account_and_age_group.journal_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    payables_list_by_account_and_age_group = Elmas::PayablesListByAccountAndAgeGroup.new({ this_does_not_exist: "Piet" })
    expect(payables_list_by_account_and_age_group.try(:journal_description)).to eq nil
  end



  let(:resource) { resource = Elmas::PayablesListByAccountAndAgeGroup.new(id: "12abcdef-1234-1234-1234-123456abcdef", journal_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesListByAccountAndAgeGroup(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesListByAccountAndAgeGroup?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesListByAccountAndAgeGroup?$filter=JournalDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:journal_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesListByAccountAndAgeGroup?$orderby=JournalDescription&$filter=JournalDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:journal_description, :id], order_by: :journal_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesListByAccountAndAgeGroup?$orderby=JournalDescription")
      resource.find_all(order_by: :journal_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesListByAccountAndAgeGroup?$select=JournalDescription")
      resource.find_all(select: [:journal_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesListByAccountAndAgeGroup?$select=JournalDescription")
      resource.find_by(select: [:journal_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesListByAccountAndAgeGroup?$select=JournalDescription,ID")
      resource.find_all(select: [:journal_description, :id])
    end
  end
end
