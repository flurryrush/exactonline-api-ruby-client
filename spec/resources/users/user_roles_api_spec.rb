require 'spec_helper'

describe Elmas::UserRole do
  it "can initialize" do
    user_role = Elmas::UserRole.new
    expect(user_role).to be_a(Elmas::UserRole)
  end

  it "accepts attribute setter" do
    user_role = Elmas::UserRole.new
    user_role.user_id = "78238"
    expect(user_role.user_id).to eq "78238"
  end

  it "returns value for getters" do
    user_role = Elmas::UserRole.new({ "UserID" => "345" })
    expect(user_role.user_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    user_role = Elmas::UserRole.new({ this_does_not_exist: "Piet" })
    expect(user_role.try(:user_id)).to eq nil
  end



  let(:resource) { resource = Elmas::UserRole.new(id: "12abcdef-1234-1234-1234-123456abcdef", user_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("users/UserRoles(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("users/UserRoles?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("users/UserRoles?$filter=UserID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:user_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("users/UserRoles?$orderby=UserID&$filter=UserID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:user_id, :id], order_by: :user_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("users/UserRoles?$orderby=UserID")
      resource.find_all(order_by: :user_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("users/UserRoles?$select=UserID")
      resource.find_all(select: [:user_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("users/UserRoles?$select=UserID")
      resource.find_by(select: [:user_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("users/UserRoles?$select=UserID,ID")
      resource.find_all(select: [:user_id, :id])
    end
  end
end
