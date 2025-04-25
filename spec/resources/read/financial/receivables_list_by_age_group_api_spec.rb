require 'spec_helper'

describe Elmas::ReceivablesListByAgeGroup do
  it "can initialize" do
    receivables_list_by_age_group = Elmas::ReceivablesListByAgeGroup.new
    expect(receivables_list_by_age_group).to be_a(Elmas::ReceivablesListByAgeGroup)
  end

  it "accepts attribute setter" do
    receivables_list_by_age_group = Elmas::ReceivablesListByAgeGroup.new
    receivables_list_by_age_group.journal_description = "78238"
    expect(receivables_list_by_age_group.journal_description).to eq "78238"
  end

  it "returns value for getters" do
    receivables_list_by_age_group = Elmas::ReceivablesListByAgeGroup.new({ "JournalDescription" => "345" })
    expect(receivables_list_by_age_group.journal_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    receivables_list_by_age_group = Elmas::ReceivablesListByAgeGroup.new({ this_does_not_exist: "Piet" })
    expect(receivables_list_by_age_group.try(:journal_description)).to eq nil
  end



  let(:resource) { resource = Elmas::ReceivablesListByAgeGroup.new(id: "12abcdef-1234-1234-1234-123456abcdef", journal_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAgeGroup(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAgeGroup?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAgeGroup?$filter=JournalDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:journal_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAgeGroup?$orderby=JournalDescription&$filter=JournalDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:journal_description, :id], order_by: :journal_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAgeGroup?$orderby=JournalDescription")
      resource.find_all(order_by: :journal_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAgeGroup?$select=JournalDescription")
      resource.find_all(select: [:journal_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAgeGroup?$select=JournalDescription")
      resource.find_by(select: [:journal_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAgeGroup?$select=JournalDescription,ID")
      resource.find_all(select: [:journal_description, :id])
    end
  end
end
