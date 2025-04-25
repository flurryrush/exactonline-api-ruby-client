require 'spec_helper'

describe Elmas::UserHasRight do
  it "can initialize" do
    user_has_right = Elmas::UserHasRight.new
    expect(user_has_right).to be_a(Elmas::UserHasRight)
  end

  let(:resource) { resource = Elmas::UserHasRight.new(id: "12abcdef-1234-1234-1234-123456abcdef") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("users/UserHasRights(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("users/UserHasRights?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("users/UserHasRights?$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
      expect(Elmas).to receive(:get).with("users/UserHasRights?$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:id])
    end
  end

  context "Applying select" do
    it "should apply one select" do
      expect(Elmas).to receive(:get).with("users/UserHasRights?$select=ID")
      resource.find_all(select: [:id])
    end
  end
end
