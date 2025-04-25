require 'spec_helper'

describe Elmas::HoursByDate do
  it "can initialize" do
    hours_by_date = Elmas::HoursByDate.new
    expect(hours_by_date).to be_a(Elmas::HoursByDate)
  end

  it "accepts attribute setter" do
    hours_by_date = Elmas::HoursByDate.new
    hours_by_date.hours_draft = "78238"
    expect(hours_by_date.hours_draft).to eq "78238"
  end

  it "returns value for getters" do
    hours_by_date = Elmas::HoursByDate.new({ "HoursDraft" => "345" })
    expect(hours_by_date.hours_draft).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    hours_by_date = Elmas::HoursByDate.new({ this_does_not_exist: "Piet" })
    expect(hours_by_date.try(:hours_draft)).to eq nil
  end



  let(:resource) { resource = Elmas::HoursByDate.new(id: "12abcdef-1234-1234-1234-123456abcdef", hours_draft: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/HoursByDate(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/HoursByDate?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/HoursByDate?$filter=HoursDraft eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:hours_draft, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/HoursByDate?$orderby=HoursDraft&$filter=HoursDraft eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:hours_draft, :id], order_by: :hours_draft)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/HoursByDate?$orderby=HoursDraft")
      resource.find_all(order_by: :hours_draft)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HoursByDate?$select=HoursDraft")
      resource.find_all(select: [:hours_draft])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/HoursByDate?$select=HoursDraft")
      resource.find_by(select: [:hours_draft])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/HoursByDate?$select=HoursDraft,ID")
      resource.find_all(select: [:hours_draft, :id])
    end
  end
end
