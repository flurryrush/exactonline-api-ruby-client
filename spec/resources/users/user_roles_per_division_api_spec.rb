require 'spec_helper'

describe Elmas::UserRolesPerDivision do
  it "can initialize" do
    user_roles_per_division = Elmas::UserRolesPerDivision.new
    expect(user_roles_per_division).to be_a(Elmas::UserRolesPerDivision)
  end

  it "accepts attribute setter" do
    user_roles_per_division = Elmas::UserRolesPerDivision.new
    user_roles_per_division.modifier_full_name = "78238"
    expect(user_roles_per_division.modifier_full_name).to eq "78238"
  end

  it "returns value for getters" do
    user_roles_per_division = Elmas::UserRolesPerDivision.new({ "ModifierFullName" => "345" })
    expect(user_roles_per_division.modifier_full_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    user_roles_per_division = Elmas::UserRolesPerDivision.new({ this_does_not_exist: "Piet" })
    expect(user_roles_per_division.try(:modifier_full_name)).to eq nil
  end



  let(:resource) { resource = Elmas::UserRolesPerDivision.new(id: "12abcdef-1234-1234-1234-123456abcdef", modifier_full_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("users/UserRolesPerDivision(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("users/UserRolesPerDivision?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("users/UserRolesPerDivision?$filter=ModifierFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier_full_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("users/UserRolesPerDivision?$orderby=ModifierFullName&$filter=ModifierFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier_full_name, :id], order_by: :modifier_full_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("users/UserRolesPerDivision?$orderby=ModifierFullName")
      resource.find_all(order_by: :modifier_full_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("users/UserRolesPerDivision?$select=ModifierFullName")
      resource.find_all(select: [:modifier_full_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("users/UserRolesPerDivision?$select=ModifierFullName")
      resource.find_by(select: [:modifier_full_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("users/UserRolesPerDivision?$select=ModifierFullName,ID")
      resource.find_all(select: [:modifier_full_name, :id])
    end
  end
end
