require 'spec_helper'

describe Elmas::SolutionLink do
  it "can initialize" do
    solution_link = Elmas::SolutionLink.new
    expect(solution_link).to be_a(Elmas::SolutionLink)
  end

  it "accepts attribute setter" do
    solution_link = Elmas::SolutionLink.new
    solution_link.creator = "78238"
    expect(solution_link.creator).to eq "78238"
  end

  it "returns value for getters" do
    solution_link = Elmas::SolutionLink.new({ "Creator" => "345" })
    expect(solution_link.creator).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    solution_link = Elmas::SolutionLink.new({ this_does_not_exist: "Piet" })
    expect(solution_link.try(:creator)).to eq nil
  end

  it "is valid with mandatory attributes" do
    solution_link = Elmas::SolutionLink.new(account: "Account", solution_type: "SolutionType")
    expect(solution_link.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    solution_link = Elmas::SolutionLink.new
    expect(solution_link.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SolutionLink.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("accountancy/SolutionLinks(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("accountancy/SolutionLinks?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("accountancy/SolutionLinks?$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("accountancy/SolutionLinks?$orderby=Creator&$filter=Creator eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator, :id], order_by: :creator)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("accountancy/SolutionLinks?$orderby=Creator")
      resource.find_all(order_by: :creator)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("accountancy/SolutionLinks?$select=Creator")
      resource.find_all(select: [:creator])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("accountancy/SolutionLinks?$select=Creator")
      resource.find_by(select: [:creator])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("accountancy/SolutionLinks?$select=Creator,ID")
      resource.find_all(select: [:creator, :id])
    end
  end
end
