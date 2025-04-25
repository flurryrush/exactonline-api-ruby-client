require 'spec_helper'

describe Elmas::PreviousYearAfterEntry do
  it "can initialize" do
    previous_year_after_entry = Elmas::PreviousYearAfterEntry.new
    expect(previous_year_after_entry).to be_a(Elmas::PreviousYearAfterEntry)
  end

  it "accepts attribute setter" do
    previous_year_after_entry = Elmas::PreviousYearAfterEntry.new
    previous_year_after_entry.division = "78238"
    expect(previous_year_after_entry.division).to eq "78238"
  end

  it "returns value for getters" do
    previous_year_after_entry = Elmas::PreviousYearAfterEntry.new({ "Division" => "345" })
    expect(previous_year_after_entry.division).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    previous_year_after_entry = Elmas::PreviousYearAfterEntry.new({ this_does_not_exist: "Piet" })
    expect(previous_year_after_entry.try(:division)).to eq nil
  end



  let(:resource) { resource = Elmas::PreviousYearAfterEntry.new(id: "12abcdef-1234-1234-1234-123456abcdef", division: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/AfterEntry(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/AfterEntry?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/AfterEntry?$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/AfterEntry?$orderby=Division&$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id], order_by: :division)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/AfterEntry?$orderby=Division")
      resource.find_all(order_by: :division)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/AfterEntry?$select=Division")
      resource.find_all(select: [:division])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/AfterEntry?$select=Division")
      resource.find_by(select: [:division])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/AfterEntry?$select=Division,ID")
      resource.find_all(select: [:division, :id])
    end
  end
end
