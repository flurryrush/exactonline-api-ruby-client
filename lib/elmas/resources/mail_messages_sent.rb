# frozen_string_literal: true

module Elmas
  # Endpoint
  # MailMessagesSent
  #
  # Good to know
  # Use this endpoint to get information related to a mail message or create a mail message.
  # Important notes:To use this endpoint, the Mailbox feature set is required in the license
  #
  # Scope
  # Communication mailboxes
  class MailMessagesSent
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "mailbox/MailMessagesSent"
    end

    def mandatory_attributes
      %i[
        recipient_mailbox_id sender_mailbox_id subject
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=MailboxMailMessagesSent
    def other_attributes
      %i[
        bank bank_account country created creator creator_full_name for_division modified modifier
        modifier_full_name operation original_message original_message_subject partner_key quantity
        recipient_account recipient_deleted recipient_mailbox recipient_mailbox_description
        recipient_status recipient_status_description sender_account sender_date_sent
        sender_deleted sender_ip_address sender_mailbox sender_mailbox_description
        skip_recipient_mail_box_address_override synchronization_code type
      ]
    end
  end
end
