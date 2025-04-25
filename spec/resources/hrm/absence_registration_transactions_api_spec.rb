require 'spec_helper'

describe Elmas::AbsenceRegistrationTransaction do
  it "can initialize" do
    absence_registration_transaction = Elmas::AbsenceRegistrationTransaction.new
    expect(absence_registration_transaction).to be_a(Elmas::AbsenceRegistrationTransaction)
  end

  it "accepts attribute setter" do
    absence_registration_transaction = Elmas::AbsenceRegistrationTransaction.new
    absence_registration_transaction.status = "78238"
    expect(absence_registration_transaction.status).to eq "78238"
  end

  it "returns value for getters" do
    absence_registration_transaction = Elmas::AbsenceRegistrationTransaction.new({ "Status" => "345" })
    expect(absence_registration_transaction.status).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    absence_registration_transaction = Elmas::AbsenceRegistrationTransaction.new({ this_does_not_exist: "Piet" })
    expect(absence_registration_transaction.try(:status)).to eq nil
  end



  let(:resource) { resource = Elmas::AbsenceRegistrationTransaction.new(id: "12abcdef-1234-1234-1234-123456abcdef", status: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrationTransactions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrationTransactions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrationTransactions?$filter=Status eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:status, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrationTransactions?$orderby=Status&$filter=Status eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:status, :id], order_by: :status)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrationTransactions?$orderby=Status")
      resource.find_all(order_by: :status)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrationTransactions?$select=Status")
      resource.find_all(select: [:status])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrationTransactions?$select=Status")
      resource.find_by(select: [:status])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/AbsenceRegistrationTransactions?$select=Status,ID")
      resource.find_all(select: [:status, :id])
    end
  end
end
