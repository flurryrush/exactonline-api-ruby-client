# frozen_string_literal: true

module Elmas
  # Endpoint
  # DefaultMailbox
  #
  # Good to know
  # Use this endpoint to retrieve the digital postbox of an administration.
  #  If there is none assigned to this administration, it will grab the first digital postbox it encounters for the account.
  #  For more information about digital postbox, kindly refer to the following help file Digital Postbox.
  # Important notes:To use this endpoint, the Mailbox feature set is required in the license
  #
  # Scope
  # Communication mailboxes
  class DefaultMailbox
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/mailbox/DefaultMailbox"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadMailboxDefaultMailbox
    def other_attributes
      %i[
        created creator description for_division is_scan_service_mailbox mailbox modified modifier
        valid_from valid_to
      ]
    end
  end
end
