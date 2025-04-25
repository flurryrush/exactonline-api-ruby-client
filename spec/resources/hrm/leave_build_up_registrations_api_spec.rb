require 'spec_helper'

describe Elmas::LeaveBuildUpRegistration do
  it "can initialize" do
    leave_build_up_registration = Elmas::LeaveBuildUpRegistration.new
    expect(leave_build_up_registration).to be_a(Elmas::LeaveBuildUpRegistration)
  end

  it "accepts attribute setter" do
    leave_build_up_registration = Elmas::LeaveBuildUpRegistration.new
    leave_build_up_registration.division = "78238"
    expect(leave_build_up_registration.division).to eq "78238"
  end

  it "returns value for getters" do
    leave_build_up_registration = Elmas::LeaveBuildUpRegistration.new({ "Division" => "345" })
    expect(leave_build_up_registration.division).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    leave_build_up_registration = Elmas::LeaveBuildUpRegistration.new({ this_does_not_exist: "Piet" })
    expect(leave_build_up_registration.try(:division)).to eq nil
  end



  let(:resource) { resource = Elmas::LeaveBuildUpRegistration.new(id: "12abcdef-1234-1234-1234-123456abcdef", division: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("hrm/LeaveBuildUpRegistrations(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("hrm/LeaveBuildUpRegistrations?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("hrm/LeaveBuildUpRegistrations?$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("hrm/LeaveBuildUpRegistrations?$orderby=Division&$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id], order_by: :division)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("hrm/LeaveBuildUpRegistrations?$orderby=Division")
      resource.find_all(order_by: :division)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/LeaveBuildUpRegistrations?$select=Division")
      resource.find_all(select: [:division])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("hrm/LeaveBuildUpRegistrations?$select=Division")
      resource.find_by(select: [:division])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/LeaveBuildUpRegistrations?$select=Division,ID")
      resource.find_all(select: [:division, :id])
    end
  end
end
