require 'spec_helper'

describe Elmas::CommunicationNote do
  it "can initialize" do
    communication_note = Elmas::CommunicationNote.new
    expect(communication_note).to be_a(Elmas::CommunicationNote)
  end

  it "accepts attribute setter" do
    communication_note = Elmas::CommunicationNote.new
    communication_note.hid = "78238"
    expect(communication_note.hid).to eq "78238"
  end

  it "returns value for getters" do
    communication_note = Elmas::CommunicationNote.new({ "Hid" => "345" })
    expect(communication_note.hid).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    communication_note = Elmas::CommunicationNote.new({ this_does_not_exist: "Piet" })
    expect(communication_note.try(:hid)).to eq nil
  end



  let(:resource) { resource = Elmas::CommunicationNote.new(id: "12abcdef-1234-1234-1234-123456abcdef", hid: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("activities/CommunicationNotes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("activities/CommunicationNotes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("activities/CommunicationNotes?$filter=Hid eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:hid, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("activities/CommunicationNotes?$orderby=Hid&$filter=Hid eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:hid, :id], order_by: :hid)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("activities/CommunicationNotes?$orderby=Hid")
      resource.find_all(order_by: :hid)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("activities/CommunicationNotes?$select=Hid")
      resource.find_all(select: [:hid])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("activities/CommunicationNotes?$select=Hid")
      resource.find_by(select: [:hid])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("activities/CommunicationNotes?$select=Hid,ID")
      resource.find_all(select: [:hid, :id])
    end
  end
end
