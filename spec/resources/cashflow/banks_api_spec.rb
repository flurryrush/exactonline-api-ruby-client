require 'spec_helper'

describe Elmas::Bank do
  it "can initialize" do
    bank = Elmas::Bank.new
    expect(bank).to be_a(Elmas::Bank)
  end

  it "accepts attribute setter" do
    bank = Elmas::Bank.new
    bank.modified = "78238"
    expect(bank.modified).to eq "78238"
  end

  it "returns value for getters" do
    bank = Elmas::Bank.new({ "Modified" => "345" })
    expect(bank.modified).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bank = Elmas::Bank.new({ this_does_not_exist: "Piet" })
    expect(bank.try(:modified)).to eq nil
  end



  let(:resource) { resource = Elmas::Bank.new(id: "12abcdef-1234-1234-1234-123456abcdef", modified: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("cashflow/Banks(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("cashflow/Banks?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("cashflow/Banks?$filter=Modified eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modified, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("cashflow/Banks?$orderby=Modified&$filter=Modified eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modified, :id], order_by: :modified)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("cashflow/Banks?$orderby=Modified")
      resource.find_all(order_by: :modified)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("cashflow/Banks?$select=Modified")
      resource.find_all(select: [:modified])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("cashflow/Banks?$select=Modified")
      resource.find_by(select: [:modified])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("cashflow/Banks?$select=Modified,ID")
      resource.find_all(select: [:modified, :id])
    end
  end
end
