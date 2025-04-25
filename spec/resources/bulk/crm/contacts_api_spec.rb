require 'spec_helper'

describe Elmas::BulkCRMContact do
  it "can initialize" do
    bulk_crm_contact = Elmas::BulkCRMContact.new
    expect(bulk_crm_contact).to be_a(Elmas::BulkCRMContact)
  end

  it "accepts attribute setter" do
    bulk_crm_contact = Elmas::BulkCRMContact.new
    bulk_crm_contact.picture_url = "78238"
    expect(bulk_crm_contact.picture_url).to eq "78238"
  end

  it "returns value for getters" do
    bulk_crm_contact = Elmas::BulkCRMContact.new({ "PictureUrl" => "345" })
    expect(bulk_crm_contact.picture_url).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_crm_contact = Elmas::BulkCRMContact.new({ this_does_not_exist: "Piet" })
    expect(bulk_crm_contact.try(:picture_url)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_crm_contact = Elmas::BulkCRMContact.new(account: "Account", first_name: "FirstName", last_name: "LastName")
    expect(bulk_crm_contact.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_crm_contact = Elmas::BulkCRMContact.new
    expect(bulk_crm_contact.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkCRMContact.new(id: "12abcdef-1234-1234-1234-123456abcdef", picture_url: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Contacts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Contacts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Contacts?$filter=PictureUrl eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:picture_url, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Contacts?$orderby=PictureUrl&$filter=PictureUrl eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:picture_url, :id], order_by: :picture_url)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/CRM/Contacts?$orderby=PictureUrl")
      resource.find_all(order_by: :picture_url)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Contacts?$select=PictureUrl")
      resource.find_all(select: [:picture_url])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Contacts?$select=PictureUrl")
      resource.find_by(select: [:picture_url])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/CRM/Contacts?$select=PictureUrl,ID")
      resource.find_all(select: [:picture_url, :id])
    end
  end
end
