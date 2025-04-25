require 'spec_helper'

describe Elmas::SyncFinancialGLAccount do
  it "can initialize" do
    sync_financial_gl_account = Elmas::SyncFinancialGLAccount.new
    expect(sync_financial_gl_account).to be_a(Elmas::SyncFinancialGLAccount)
  end

  it "accepts attribute setter" do
    sync_financial_gl_account = Elmas::SyncFinancialGLAccount.new
    sync_financial_gl_account.type_description = "78238"
    expect(sync_financial_gl_account.type_description).to eq "78238"
  end

  it "returns value for getters" do
    sync_financial_gl_account = Elmas::SyncFinancialGLAccount.new({ "TypeDescription" => "345" })
    expect(sync_financial_gl_account.type_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_financial_gl_account = Elmas::SyncFinancialGLAccount.new({ this_does_not_exist: "Piet" })
    expect(sync_financial_gl_account.try(:type_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_financial_gl_account = Elmas::SyncFinancialGLAccount.new(code: "Code", description: "Description")
    expect(sync_financial_gl_account.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_financial_gl_account = Elmas::SyncFinancialGLAccount.new
    expect(sync_financial_gl_account.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncFinancialGLAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", type_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Financial/GLAccounts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Financial/GLAccounts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Financial/GLAccounts?$filter=TypeDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Financial/GLAccounts?$orderby=TypeDescription&$filter=TypeDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type_description, :id], order_by: :type_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Financial/GLAccounts?$orderby=TypeDescription")
      resource.find_all(order_by: :type_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Financial/GLAccounts?$select=TypeDescription")
      resource.find_all(select: [:type_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Financial/GLAccounts?$select=TypeDescription")
      resource.find_by(select: [:type_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Financial/GLAccounts?$select=TypeDescription,ID")
      resource.find_all(select: [:type_description, :id])
    end
  end
end
