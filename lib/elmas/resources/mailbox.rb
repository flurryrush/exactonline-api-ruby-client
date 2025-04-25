# frozen_string_literal: true

module Elmas
  # Endpoint
  # Mailbox
  #
  # Good to know
  # Use this endpoint to retrieve, create, update or delete an accounts from digital postbox.
  #  For more information about digital postbox, kindly refer to the following help file Digital Postbox.
  # Important notes:To use this endpoint, the Mailbox feature set is required in the license
  #
  # Scope
  # Communication mailboxes
  class Mailbox
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "mailbox/Mailboxes"
    end

    def mandatory_attributes
      %i[
        mailbox
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=MailboxMailboxes
    def other_attributes
      %i[
        account account_name created creator creator_full_name description for_division
        for_division_description modified modifier modifier_full_name publish type valid_from
        valid_to
      ]
    end
  end
end
