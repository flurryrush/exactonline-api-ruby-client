require 'spec_helper'

describe Elmas::HoursById do
  it "can initialize" do
    hours_by_id = Elmas::HoursById.new
    expect(hours_by_id).to be_a(Elmas::HoursById)
  end

  it "accepts attribute setter" do
    hours_by_id = Elmas::HoursById.new
    hours_by_id.notes = "78238"
    expect(hours_by_id.notes).to eq "78238"
  end

  it "returns value for getters" do
    hours_by_id = Elmas::HoursById.new({ "Notes" => "345" })
    expect(hours_by_id.notes).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    hours_by_id = Elmas::HoursById.new({ this_does_not_exist: "Piet" })
    expect(hours_by_id.try(:notes)).to eq nil
  end



  let(:resource) { resource = Elmas::HoursById.new(id: "12abcdef-1234-1234-1234-123456abcdef", notes: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/HoursById(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/HoursById?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/HoursById?$filter=Notes eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:notes, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/HoursById?$orderby=Notes&$filter=Notes eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:notes, :id], order_by: :notes)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/HoursById?$orderby=Notes")
      resource.find_all(order_by: :notes)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HoursById?$select=Notes")
      resource.find_all(select: [:notes])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/HoursById?$select=Notes")
      resource.find_by(select: [:notes])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HoursById?$select=Notes,ID")
      resource.find_all(select: [:notes, :id])
    end
  end
end
