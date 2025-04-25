require 'spec_helper'

describe Elmas::AssetGroup do
  it "can initialize" do
    asset_group = Elmas::AssetGroup.new
    expect(asset_group).to be_a(Elmas::AssetGroup)
  end

  it "accepts attribute setter" do
    asset_group = Elmas::AssetGroup.new
    asset_group.gl_account_depreciation_bs_code = "78238"
    expect(asset_group.gl_account_depreciation_bs_code).to eq "78238"
  end

  it "returns value for getters" do
    asset_group = Elmas::AssetGroup.new({ "GLAccountDepreciationBsCode" => "345" })
    expect(asset_group.gl_account_depreciation_bs_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    asset_group = Elmas::AssetGroup.new({ this_does_not_exist: "Piet" })
    expect(asset_group.try(:gl_account_depreciation_bs_code)).to eq nil
  end



  let(:resource) { resource = Elmas::AssetGroup.new(id: "12abcdef-1234-1234-1234-123456abcdef", gl_account_depreciation_bs_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("assets/AssetGroups(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("assets/AssetGroups?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("assets/AssetGroups?$filter=GLAccountDepreciationBsCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:gl_account_depreciation_bs_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("assets/AssetGroups?$orderby=GLAccountDepreciationBsCode&$filter=GLAccountDepreciationBsCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:gl_account_depreciation_bs_code, :id], order_by: :gl_account_depreciation_bs_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("assets/AssetGroups?$orderby=GLAccountDepreciationBsCode")
      resource.find_all(order_by: :gl_account_depreciation_bs_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("assets/AssetGroups?$select=GLAccountDepreciationBsCode")
      resource.find_all(select: [:gl_account_depreciation_bs_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("assets/AssetGroups?$select=GLAccountDepreciationBsCode")
      resource.find_by(select: [:gl_account_depreciation_bs_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("assets/AssetGroups?$select=GLAccountDepreciationBsCode,ID")
      resource.find_all(select: [:gl_account_depreciation_bs_code, :id])
    end
  end
end
