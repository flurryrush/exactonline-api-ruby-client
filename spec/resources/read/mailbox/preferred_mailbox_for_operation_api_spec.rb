require 'spec_helper'

describe Elmas::PreferredMailboxForOperation do
  it "can initialize" do
    preferred_mailbox_for_operation = Elmas::PreferredMailboxForOperation.new
    expect(preferred_mailbox_for_operation).to be_a(Elmas::PreferredMailboxForOperation)
  end

  it "accepts attribute setter" do
    preferred_mailbox_for_operation = Elmas::PreferredMailboxForOperation.new
    preferred_mailbox_for_operation.is_scan_service_mailbox = "78238"
    expect(preferred_mailbox_for_operation.is_scan_service_mailbox).to eq "78238"
  end

  it "returns value for getters" do
    preferred_mailbox_for_operation = Elmas::PreferredMailboxForOperation.new({ "IsScanServiceMailbox" => "345" })
    expect(preferred_mailbox_for_operation.is_scan_service_mailbox).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    preferred_mailbox_for_operation = Elmas::PreferredMailboxForOperation.new({ this_does_not_exist: "Piet" })
    expect(preferred_mailbox_for_operation.try(:is_scan_service_mailbox)).to eq nil
  end



  let(:resource) { resource = Elmas::PreferredMailboxForOperation.new(id: "12abcdef-1234-1234-1234-123456abcdef", is_scan_service_mailbox: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/mailbox/PreferredMailboxForOperation(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/mailbox/PreferredMailboxForOperation?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/mailbox/PreferredMailboxForOperation?$filter=IsScanServiceMailbox eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_scan_service_mailbox, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/mailbox/PreferredMailboxForOperation?$orderby=IsScanServiceMailbox&$filter=IsScanServiceMailbox eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:is_scan_service_mailbox, :id], order_by: :is_scan_service_mailbox)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/mailbox/PreferredMailboxForOperation?$orderby=IsScanServiceMailbox")
      resource.find_all(order_by: :is_scan_service_mailbox)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/mailbox/PreferredMailboxForOperation?$select=IsScanServiceMailbox")
      resource.find_all(select: [:is_scan_service_mailbox])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/mailbox/PreferredMailboxForOperation?$select=IsScanServiceMailbox")
      resource.find_by(select: [:is_scan_service_mailbox])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/mailbox/PreferredMailboxForOperation?$select=IsScanServiceMailbox,ID")
      resource.find_all(select: [:is_scan_service_mailbox, :id])
    end
  end
end
