require 'spec_helper'

describe Elmas::Incoterm do
  it "can initialize" do
    incoterm = Elmas::Incoterm.new
    expect(incoterm).to be_a(Elmas::Incoterm)
  end

  it "accepts attribute setter" do
    incoterm = Elmas::Incoterm.new
    incoterm.version = "78238"
    expect(incoterm.version).to eq "78238"
  end

  it "returns value for getters" do
    incoterm = Elmas::Incoterm.new({ "Version" => "345" })
    expect(incoterm.version).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    incoterm = Elmas::Incoterm.new({ this_does_not_exist: "Piet" })
    expect(incoterm.try(:version)).to eq nil
  end



  let(:resource) { resource = Elmas::Incoterm.new(id: "12abcdef-1234-1234-1234-123456abcdef", version: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("logistics/Incoterms(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("logistics/Incoterms?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("logistics/Incoterms?$filter=Version eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:version, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("logistics/Incoterms?$orderby=Version&$filter=Version eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:version, :id], order_by: :version)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("logistics/Incoterms?$orderby=Version")
      resource.find_all(order_by: :version)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/Incoterms?$select=Version")
      resource.find_all(select: [:version])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("logistics/Incoterms?$select=Version")
      resource.find_by(select: [:version])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/Incoterms?$select=Version,ID")
      resource.find_all(select: [:version, :id])
    end
  end
end
