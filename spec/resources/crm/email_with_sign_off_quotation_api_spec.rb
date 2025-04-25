require 'spec_helper'

describe Elmas::EmailWithSignOffQuotation do
  it "can initialize" do
    email_with_sign_off_quotation = Elmas::EmailWithSignOffQuotation.new
    expect(email_with_sign_off_quotation).to be_a(Elmas::EmailWithSignOffQuotation)
  end

  it "accepts attribute setter" do
    email_with_sign_off_quotation = Elmas::EmailWithSignOffQuotation.new
    email_with_sign_off_quotation.project_classification = "78238"
    expect(email_with_sign_off_quotation.project_classification).to eq "78238"
  end

  it "returns value for getters" do
    email_with_sign_off_quotation = Elmas::EmailWithSignOffQuotation.new({ "ProjectClassification" => "345" })
    expect(email_with_sign_off_quotation.project_classification).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    email_with_sign_off_quotation = Elmas::EmailWithSignOffQuotation.new({ this_does_not_exist: "Piet" })
    expect(email_with_sign_off_quotation.try(:project_classification)).to eq nil
  end

  it "is valid with mandatory attributes" do
    email_with_sign_off_quotation = Elmas::EmailWithSignOffQuotation.new(quotation_id: "QuotationID", email_layout: "EmailLayout")
    expect(email_with_sign_off_quotation.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    email_with_sign_off_quotation = Elmas::EmailWithSignOffQuotation.new
    expect(email_with_sign_off_quotation.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::EmailWithSignOffQuotation.new(id: "12abcdef-1234-1234-1234-123456abcdef", project_classification: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/EmailWithSignOffQuotation(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/EmailWithSignOffQuotation?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/EmailWithSignOffQuotation?$filter=ProjectClassification eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_classification, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/EmailWithSignOffQuotation?$orderby=ProjectClassification&$filter=ProjectClassification eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_classification, :id], order_by: :project_classification)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/EmailWithSignOffQuotation?$orderby=ProjectClassification")
      resource.find_all(order_by: :project_classification)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/EmailWithSignOffQuotation?$select=ProjectClassification")
      resource.find_all(select: [:project_classification])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/EmailWithSignOffQuotation?$select=ProjectClassification")
      resource.find_by(select: [:project_classification])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/EmailWithSignOffQuotation?$select=ProjectClassification,ID")
      resource.find_all(select: [:project_classification, :id])
    end
  end
end
