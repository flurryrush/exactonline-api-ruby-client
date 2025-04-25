require 'spec_helper'

describe Elmas::MaterialIssue do
  it "can initialize" do
    material_issue = Elmas::MaterialIssue.new
    expect(material_issue).to be_a(Elmas::MaterialIssue)
  end

  it "accepts attribute setter" do
    material_issue = Elmas::MaterialIssue.new
    material_issue.item_picture_url = "78238"
    expect(material_issue.item_picture_url).to eq "78238"
  end

  it "returns value for getters" do
    material_issue = Elmas::MaterialIssue.new({ "ItemPictureUrl" => "345" })
    expect(material_issue.item_picture_url).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    material_issue = Elmas::MaterialIssue.new({ this_does_not_exist: "Piet" })
    expect(material_issue.try(:item_picture_url)).to eq nil
  end

  it "is valid with mandatory attributes" do
    material_issue = Elmas::MaterialIssue.new(quantity: "Quantity", shop_order_material_plan: "ShopOrderMaterialPlan", transaction_date: "TransactionDate")
    expect(material_issue.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    material_issue = Elmas::MaterialIssue.new
    expect(material_issue.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::MaterialIssue.new(id: "12abcdef-1234-1234-1234-123456abcdef", item_picture_url: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("manufacturing/MaterialIssues(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("manufacturing/MaterialIssues?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("manufacturing/MaterialIssues?$filter=ItemPictureUrl eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_picture_url, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("manufacturing/MaterialIssues?$orderby=ItemPictureUrl&$filter=ItemPictureUrl eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:item_picture_url, :id], order_by: :item_picture_url)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("manufacturing/MaterialIssues?$orderby=ItemPictureUrl")
      resource.find_all(order_by: :item_picture_url)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/MaterialIssues?$select=ItemPictureUrl")
      resource.find_all(select: [:item_picture_url])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("manufacturing/MaterialIssues?$select=ItemPictureUrl")
      resource.find_by(select: [:item_picture_url])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("manufacturing/MaterialIssues?$select=ItemPictureUrl,ID")
      resource.find_all(select: [:item_picture_url, :id])
    end
  end
end
