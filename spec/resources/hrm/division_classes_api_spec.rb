require 'spec_helper'

describe Elmas::DivisionClass do
  it "can initialize" do
    division_class = Elmas::DivisionClass.new
    expect(division_class).to be_a(Elmas::DivisionClass)
  end

  it "accepts attribute setter" do
    division_class = Elmas::DivisionClass.new
    division_class.sequence_nr = "78238"
    expect(division_class.sequence_nr).to eq "78238"
  end

  it "returns value for getters" do
    division_class = Elmas::DivisionClass.new({ "SequenceNr" => "345" })
    expect(division_class.sequence_nr).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    division_class = Elmas::DivisionClass.new({ this_does_not_exist: "Piet" })
    expect(division_class.try(:sequence_nr)).to eq nil
  end



  let(:resource) { resource = Elmas::DivisionClass.new(id: "12abcdef-1234-1234-1234-123456abcdef", sequence_nr: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("hrm/DivisionClasses(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("hrm/DivisionClasses?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("hrm/DivisionClasses?$filter=SequenceNr eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:sequence_nr, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("hrm/DivisionClasses?$orderby=SequenceNr&$filter=SequenceNr eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:sequence_nr, :id], order_by: :sequence_nr)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("hrm/DivisionClasses?$orderby=SequenceNr")
      resource.find_all(order_by: :sequence_nr)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/DivisionClasses?$select=SequenceNr")
      resource.find_all(select: [:sequence_nr])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("hrm/DivisionClasses?$select=SequenceNr")
      resource.find_by(select: [:sequence_nr])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/DivisionClasses?$select=SequenceNr,ID")
      resource.find_all(select: [:sequence_nr, :id])
    end
  end
end
