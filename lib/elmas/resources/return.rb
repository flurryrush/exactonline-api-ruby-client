# frozen_string_literal: true

module Elmas
  # Endpoint
  # Return
  #
  # Good to know
  # Use this endpoint to retrieve information regarding to VAT, EC Sales List or Payroll declaration document of an administration
  #
  # Scope
  # Financial returns
  class Return
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/Returns"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialReturns
    def other_attributes
      %i[
        document_id amount created currency description document_view_url due_date frequency
        payroll_declaration_type period period_description request status subject type year
      ]
    end
  end
end
