require 'spec_helper'

describe Elmas::AbsenceRegistration do
  it "can initialize" do
    absence_registration = Elmas::AbsenceRegistration.new
    expect(absence_registration).to be_a(Elmas::AbsenceRegistration)
  end

  it "accepts attribute setter" do
    absence_registration = Elmas::AbsenceRegistration.new
    absence_registration.division = "78238"
    expect(absence_registration.division).to eq "78238"
  end

  it "returns value for getters" do
    absence_registration = Elmas::AbsenceRegistration.new({ "Division" => "345" })
    expect(absence_registration.division).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    absence_registration = Elmas::AbsenceRegistration.new({ this_does_not_exist: "Piet" })
    expect(absence_registration.try(:division)).to eq nil
  end



  let(:resource) { resource = Elmas::AbsenceRegistration.new(id: "12abcdef-1234-1234-1234-123456abcdef", division: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrations(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrations?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrations?$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrations?$orderby=Division&$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id], order_by: :division)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrations?$orderby=Division")
      resource.find_all(order_by: :division)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrations?$select=Division")
      resource.find_all(select: [:division])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrations?$select=Division")
      resource.find_by(select: [:division])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrations?$select=Division,ID")
      resource.find_all(select: [:division, :id])
    end
  end
end
