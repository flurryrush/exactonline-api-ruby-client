require 'spec_helper'

describe Elmas::TimeCorrection do
  it "can initialize" do
    time_correction = Elmas::TimeCorrection.new
    expect(time_correction).to be_a(Elmas::TimeCorrection)
  end

  it "accepts attribute setter" do
    time_correction = Elmas::TimeCorrection.new
    time_correction.modified = "78238"
    expect(time_correction.modified).to eq "78238"
  end

  it "returns value for getters" do
    time_correction = Elmas::TimeCorrection.new({ "Modified" => "345" })
    expect(time_correction.modified).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    time_correction = Elmas::TimeCorrection.new({ this_does_not_exist: "Piet" })
    expect(time_correction.try(:modified)).to eq nil
  end



  let(:resource) { resource = Elmas::TimeCorrection.new(id: "12abcdef-1234-1234-1234-123456abcdef", modified: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/TimeCorrections(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/TimeCorrections?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/TimeCorrections?$filter=Modified eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modified, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/TimeCorrections?$orderby=Modified&$filter=Modified eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modified, :id], order_by: :modified)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/TimeCorrections?$orderby=Modified")
      resource.find_all(order_by: :modified)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/TimeCorrections?$select=Modified")
      resource.find_all(select: [:modified])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/TimeCorrections?$select=Modified")
      resource.find_by(select: [:modified])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/TimeCorrections?$select=Modified,ID")
      resource.find_all(select: [:modified, :id])
    end
  end
end
