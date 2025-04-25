# frozen_string_literal: true

module Elmas
  # Endpoint
  # GLClassification
  #
  # Good to know
  # G/L Classifications are used to group G/L account balances in p&l and balance sheet.
  #  Use this endpoint to retrieve information about the G/L classifications available.
  # Add CustomDescriptionLanguage='[ NL | FR-BE | NL-BE | .
  # .
  # .
  #  ]' to the header to retrieve language sensitive properties such as descriptions in a specific language.
  # Code example API G/L account
  #
  # Scope
  # Financial generalledgers
  class GLClassification
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "financial/GLClassifications"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialGLClassifications
    def other_attributes
      %i[
        abstract balance code created creator creator_full_name description division
        is_tuple_sub_element modified modifier modifier_full_name name nillable parent period_type
        substitution_group taxonomy_namespace taxonomy_namespace_description type
      ]
    end
  end
end
