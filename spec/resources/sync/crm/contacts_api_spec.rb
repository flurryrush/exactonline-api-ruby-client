require 'spec_helper'

describe Elmas::SyncCRMContact do
  it "can initialize" do
    sync_crm_contact = Elmas::SyncCRMContact.new
    expect(sync_crm_contact).to be_a(Elmas::SyncCRMContact)
  end

  it "accepts attribute setter" do
    sync_crm_contact = Elmas::SyncCRMContact.new
    sync_crm_contact.birth_name = "78238"
    expect(sync_crm_contact.birth_name).to eq "78238"
  end

  it "returns value for getters" do
    sync_crm_contact = Elmas::SyncCRMContact.new({ "BirthName" => "345" })
    expect(sync_crm_contact.birth_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_crm_contact = Elmas::SyncCRMContact.new({ this_does_not_exist: "Piet" })
    expect(sync_crm_contact.try(:birth_name)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_crm_contact = Elmas::SyncCRMContact.new(account: "Account", first_name: "FirstName", last_name: "LastName")
    expect(sync_crm_contact.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_crm_contact = Elmas::SyncCRMContact.new
    expect(sync_crm_contact.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncCRMContact.new(id: "12abcdef-1234-1234-1234-123456abcdef", birth_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/CRM/Contacts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/CRM/Contacts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/CRM/Contacts?$filter=BirthName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:birth_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/CRM/Contacts?$orderby=BirthName&$filter=BirthName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:birth_name, :id], order_by: :birth_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/CRM/Contacts?$orderby=BirthName")
      resource.find_all(order_by: :birth_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/CRM/Contacts?$select=BirthName")
      resource.find_all(select: [:birth_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/CRM/Contacts?$select=BirthName")
      resource.find_by(select: [:birth_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/CRM/Contacts?$select=BirthName,ID")
      resource.find_all(select: [:birth_name, :id])
    end
  end
end
