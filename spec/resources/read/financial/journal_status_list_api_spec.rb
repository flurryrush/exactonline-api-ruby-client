require 'spec_helper'

describe Elmas::JournalStatusList do
  it "can initialize" do
    journal_status_list = Elmas::JournalStatusList.new
    expect(journal_status_list).to be_a(Elmas::JournalStatusList)
  end

  it "accepts attribute setter" do
    journal_status_list = Elmas::JournalStatusList.new
    journal_status_list.journal_type_description = "78238"
    expect(journal_status_list.journal_type_description).to eq "78238"
  end

  it "returns value for getters" do
    journal_status_list = Elmas::JournalStatusList.new({ "JournalTypeDescription" => "345" })
    expect(journal_status_list.journal_type_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    journal_status_list = Elmas::JournalStatusList.new({ this_does_not_exist: "Piet" })
    expect(journal_status_list.try(:journal_type_description)).to eq nil
  end



  let(:resource) { resource = Elmas::JournalStatusList.new(id: "12abcdef-1234-1234-1234-123456abcdef", journal_type_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/JournalStatusList(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/JournalStatusList?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/JournalStatusList?$filter=JournalTypeDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:journal_type_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/JournalStatusList?$orderby=JournalTypeDescription&$filter=JournalTypeDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:journal_type_description, :id], order_by: :journal_type_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/JournalStatusList?$orderby=JournalTypeDescription")
      resource.find_all(order_by: :journal_type_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/JournalStatusList?$select=JournalTypeDescription")
      resource.find_all(select: [:journal_type_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/JournalStatusList?$select=JournalTypeDescription")
      resource.find_by(select: [:journal_type_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/JournalStatusList?$select=JournalTypeDescription,ID")
      resource.find_all(select: [:journal_type_description, :id])
    end
  end
end
