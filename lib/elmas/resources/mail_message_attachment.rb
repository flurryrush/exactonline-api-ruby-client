# frozen_string_literal: true

module Elmas
  # Endpoint
  # MailMessageAttachment
  #
  # Good to know
  # Use this endpoint to get information related to a mail message attachment or add an attachment to a mail message.
  # Important notes:To use this endpoint, the Mailbox feature set is required in the license
  #
  # Scope
  # Communication mailboxes
  class MailMessageAttachment
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "mailbox/MailMessageAttachments"
    end

    def mandatory_attributes
      %i[
        attachment attachment_file_name mail_message_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=MailboxMailMessageAttachments
    def other_attributes
      %i[
        attachment_file_extension file_size mail_message_origin recipient_account sender_account
        type type_description url
      ]
    end
  end
end
