require 'spec_helper'

describe Elmas::InvolvedUser do
  it "can initialize" do
    involved_user = Elmas::InvolvedUser.new
    expect(involved_user).to be_a(Elmas::InvolvedUser)
  end

  it "accepts attribute setter" do
    involved_user = Elmas::InvolvedUser.new
    involved_user.is_main_contact = "78238"
    expect(involved_user.is_main_contact).to eq "78238"
  end

  it "returns value for getters" do
    involved_user = Elmas::InvolvedUser.new({ "IsMainContact" => "345" })
    expect(involved_user.is_main_contact).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    involved_user = Elmas::InvolvedUser.new({ this_does_not_exist: "Piet" })
    expect(involved_user.try(:is_main_contact)).to eq nil
  end



  let(:resource) { resource = Elmas::InvolvedUser.new(id: "12abcdef-1234-1234-1234-123456abcdef", is_main_contact: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("accountancy/InvolvedUsers(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("accountancy/InvolvedUsers?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("accountancy/InvolvedUsers?$filter=IsMainContact eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_main_contact, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("accountancy/InvolvedUsers?$orderby=IsMainContact&$filter=IsMainContact eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_main_contact, :id], order_by: :is_main_contact)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("accountancy/InvolvedUsers?$orderby=IsMainContact")
      resource.find_all(order_by: :is_main_contact)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("accountancy/InvolvedUsers?$select=IsMainContact")
      resource.find_all(select: [:is_main_contact])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("accountancy/InvolvedUsers?$select=IsMainContact")
      resource.find_by(select: [:is_main_contact])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("accountancy/InvolvedUsers?$select=IsMainContact,ID")
      resource.find_all(select: [:is_main_contact, :id])
    end
  end
end
