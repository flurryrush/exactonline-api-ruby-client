require 'spec_helper'

describe Elmas::Journal do
  it "can initialize" do
    journal = Elmas::Journal.new
    expect(journal).to be_a(Elmas::Journal)
  end

  it "accepts attribute setter" do
    journal = Elmas::Journal.new
    journal.currency = "78238"
    expect(journal.currency).to eq "78238"
  end

  it "returns value for getters" do
    journal = Elmas::Journal.new({ "Currency" => "345" })
    expect(journal.currency).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    journal = Elmas::Journal.new({ this_does_not_exist: "Piet" })
    expect(journal.try(:currency)).to eq nil
  end



  let(:resource) { resource = Elmas::Journal.new(id: "12abcdef-1234-1234-1234-123456abcdef", currency: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("financial/Journals(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("financial/Journals?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("financial/Journals?$filter=Currency eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:currency, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("financial/Journals?$orderby=Currency&$filter=Currency eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:currency, :id], order_by: :currency)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("financial/Journals?$orderby=Currency")
      resource.find_all(order_by: :currency)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/Journals?$select=Currency")
      resource.find_all(select: [:currency])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("financial/Journals?$select=Currency")
      resource.find_by(select: [:currency])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/Journals?$select=Currency,ID")
      resource.find_all(select: [:currency, :id])
    end
  end
end
