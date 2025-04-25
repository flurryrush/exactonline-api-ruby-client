# frozen_string_literal: true

module Elmas
  # Endpoint
  # PreferredMailbox
  #
  # Good to know
  # Important notes:To use this endpoint, the Mailbox feature set is required in the license
  #
  # Scope
  # Communication mailboxes
  class PreferredMailbox
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/mailbox/PreferredMailbox"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadMailboxPreferredMailbox
    def other_attributes
      %i[
        created creator description for_division is_scan_service_mailbox mailbox modified modifier
        valid_from valid_to
      ]
    end
  end
end
