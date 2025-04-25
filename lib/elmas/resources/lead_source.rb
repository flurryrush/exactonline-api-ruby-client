# frozen_string_literal: true

module Elmas
  # Endpoint
  # LeadSource
  #
  # Good to know
  # With this endpoint you can get information about master data for LeadSource associated with Account or Contact.
  #  Furthermore, you can also get a specific LeadSource data by providing LeadSource ID as filter
  #
  # Scope
  # Crm accounts
  class LeadSource
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "crm/LeadSources"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMLeadSources
    def other_attributes
      %i[
        code description
      ]
    end
  end
end
