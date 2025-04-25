require 'spec_helper'

describe Elmas::GLAccountClassificationMapping do
  it "can initialize" do
    gl_account_classification_mapping = Elmas::GLAccountClassificationMapping.new
    expect(gl_account_classification_mapping).to be_a(Elmas::GLAccountClassificationMapping)
  end

  it "accepts attribute setter" do
    gl_account_classification_mapping = Elmas::GLAccountClassificationMapping.new
    gl_account_classification_mapping.gl_scheme_description = "78238"
    expect(gl_account_classification_mapping.gl_scheme_description).to eq "78238"
  end

  it "returns value for getters" do
    gl_account_classification_mapping = Elmas::GLAccountClassificationMapping.new({ "GLSchemeDescription" => "345" })
    expect(gl_account_classification_mapping.gl_scheme_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    gl_account_classification_mapping = Elmas::GLAccountClassificationMapping.new({ this_does_not_exist: "Piet" })
    expect(gl_account_classification_mapping.try(:gl_scheme_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    gl_account_classification_mapping = Elmas::GLAccountClassificationMapping.new(classification: "Classification", gl_account: "GLAccount", gl_scheme_id: "GLSchemeID")
    expect(gl_account_classification_mapping.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    gl_account_classification_mapping = Elmas::GLAccountClassificationMapping.new
    expect(gl_account_classification_mapping.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::GLAccountClassificationMapping.new(id: "12abcdef-1234-1234-1234-123456abcdef", gl_scheme_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("financial/GLAccountClassificationMappings(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("financial/GLAccountClassificationMappings?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("financial/GLAccountClassificationMappings?$filter=GLSchemeDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:gl_scheme_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("financial/GLAccountClassificationMappings?$orderby=GLSchemeDescription&$filter=GLSchemeDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:gl_scheme_description, :id], order_by: :gl_scheme_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("financial/GLAccountClassificationMappings?$orderby=GLSchemeDescription")
      resource.find_all(order_by: :gl_scheme_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/GLAccountClassificationMappings?$select=GLSchemeDescription")
      resource.find_all(select: [:gl_scheme_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("financial/GLAccountClassificationMappings?$select=GLSchemeDescription")
      resource.find_by(select: [:gl_scheme_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/GLAccountClassificationMappings?$select=GLSchemeDescription,ID")
      resource.find_all(select: [:gl_scheme_description, :id])
    end
  end
end
