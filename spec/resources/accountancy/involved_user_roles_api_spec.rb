require 'spec_helper'

describe Elmas::InvolvedUserRole do
  it "can initialize" do
    involved_user_role = Elmas::InvolvedUserRole.new
    expect(involved_user_role).to be_a(Elmas::InvolvedUserRole)
  end

  it "accepts attribute setter" do
    involved_user_role = Elmas::InvolvedUserRole.new
    involved_user_role.description_term_id = "78238"
    expect(involved_user_role.description_term_id).to eq "78238"
  end

  it "returns value for getters" do
    involved_user_role = Elmas::InvolvedUserRole.new({ "DescriptionTermID" => "345" })
    expect(involved_user_role.description_term_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    involved_user_role = Elmas::InvolvedUserRole.new({ this_does_not_exist: "Piet" })
    expect(involved_user_role.try(:description_term_id)).to eq nil
  end



  let(:resource) { resource = Elmas::InvolvedUserRole.new(id: "12abcdef-1234-1234-1234-123456abcdef", description_term_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("accountancy/InvolvedUserRoles(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("accountancy/InvolvedUserRoles?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("accountancy/InvolvedUserRoles?$filter=DescriptionTermID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description_term_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("accountancy/InvolvedUserRoles?$orderby=DescriptionTermID&$filter=DescriptionTermID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description_term_id, :id], order_by: :description_term_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("accountancy/InvolvedUserRoles?$orderby=DescriptionTermID")
      resource.find_all(order_by: :description_term_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("accountancy/InvolvedUserRoles?$select=DescriptionTermID")
      resource.find_all(select: [:description_term_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("accountancy/InvolvedUserRoles?$select=DescriptionTermID")
      resource.find_by(select: [:description_term_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("accountancy/InvolvedUserRoles?$select=DescriptionTermID,ID")
      resource.find_all(select: [:description_term_id, :id])
    end
  end
end
