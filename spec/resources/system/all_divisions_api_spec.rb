require 'spec_helper'

describe Elmas::AllDivision do
  it "can initialize" do
    all_division = Elmas::AllDivision.new
    expect(all_division).to be_a(Elmas::AllDivision)
  end

  it "accepts attribute setter" do
    all_division = Elmas::AllDivision.new
    all_division.siret_number = "78238"
    expect(all_division.siret_number).to eq "78238"
  end

  it "returns value for getters" do
    all_division = Elmas::AllDivision.new({ "SiretNumber" => "345" })
    expect(all_division.siret_number).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    all_division = Elmas::AllDivision.new({ this_does_not_exist: "Piet" })
    expect(all_division.try(:siret_number)).to eq nil
  end



  let(:resource) { resource = Elmas::AllDivision.new(id: "12abcdef-1234-1234-1234-123456abcdef", siret_number: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("system/AllDivisions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("system/AllDivisions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("system/AllDivisions?$filter=SiretNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:siret_number, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("system/AllDivisions?$orderby=SiretNumber&$filter=SiretNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:siret_number, :id], order_by: :siret_number)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("system/AllDivisions?$orderby=SiretNumber")
      resource.find_all(order_by: :siret_number)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("system/AllDivisions?$select=SiretNumber")
      resource.find_all(select: [:siret_number])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("system/AllDivisions?$select=SiretNumber")
      resource.find_by(select: [:siret_number])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("system/AllDivisions?$select=SiretNumber,ID")
      resource.find_all(select: [:siret_number, :id])
    end
  end
end
