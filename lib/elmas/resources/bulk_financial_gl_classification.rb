# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkFinancialGLClassification
  #
  # Good to know
  # Use this endpoint to retrieve a large number of G/L Classifications To view more information of the G/L classification you can use the following end point Exact Online REST API - GLClassifications.
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # Only the following filters are supported for this endpoint:
  # Code, ID, Name, Parent, TaxonomyNamespace, Type
  # 
  #
  # Scope
  # Financial generalledgers
  class BulkFinancialGLClassification
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/Financial/GLClassifications"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkFinancialGLClassifications
    def other_attributes
      %i[
        abstract balance code created creator creator_full_name description division
        is_tuple_sub_element modified modifier modifier_full_name name nillable parent period_type
        substitution_group taxonomy_namespace taxonomy_namespace_description type
      ]
    end
  end
end
