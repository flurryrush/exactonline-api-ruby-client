require 'spec_helper'

describe Elmas::Workcenter do
  it "can initialize" do
    workcenter = Elmas::Workcenter.new
    expect(workcenter).to be_a(Elmas::Workcenter)
  end

  it "accepts attribute setter" do
    workcenter = Elmas::Workcenter.new
    workcenter.notes = "78238"
    expect(workcenter.notes).to eq "78238"
  end

  it "returns value for getters" do
    workcenter = Elmas::Workcenter.new({ "Notes" => "345" })
    expect(workcenter.notes).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    workcenter = Elmas::Workcenter.new({ this_does_not_exist: "Piet" })
    expect(workcenter.try(:notes)).to eq nil
  end

  it "is valid with mandatory attributes" do
    workcenter = Elmas::Workcenter.new(code: "Code", description: "Description", status: "Status", type: "Type")
    expect(workcenter.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    workcenter = Elmas::Workcenter.new
    expect(workcenter.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::Workcenter.new(id: "12abcdef-1234-1234-1234-123456abcdef", notes: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/Workcenters(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/Workcenters?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/Workcenters?$filter=Notes eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:notes, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/Workcenters?$orderby=Notes&$filter=Notes eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:notes, :id], order_by: :notes)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/Workcenters?$orderby=Notes")
      resource.find_all(order_by: :notes)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/Workcenters?$select=Notes")
      resource.find_all(select: [:notes])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/Workcenters?$select=Notes")
      resource.find_by(select: [:notes])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/Workcenters?$select=Notes,ID")
      resource.find_all(select: [:notes, :id])
    end
  end
end
