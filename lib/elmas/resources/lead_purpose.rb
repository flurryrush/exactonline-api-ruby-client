# frozen_string_literal: true

module Elmas
  # Endpoint
  # LeadPurpose
  #
  # Good to know
  # With this endpoint you can get information about master data for LeadPurpose associated with Account or Contact.
  #  Furthermore, you can also get a specific LeadPurpose data by providing LeadPurpose ID as filter
  #
  # Scope
  # Crm accounts
  class LeadPurpose
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "crm/LeadPurposes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMLeadPurposes
    def other_attributes
      %i[
        code description
      ]
    end
  end
end
