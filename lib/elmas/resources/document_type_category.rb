# frozen_string_literal: true

module Elmas
  # Endpoint
  # DocumentTypeCategory
  #
  # Good to know
  # Document type catogories can be used to search for or filter on a specific document type.
  #  This end point returns a list of those categories
  #
  # Scope
  # Organization documents
  class DocumentTypeCategory
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "documents/DocumentTypeCategories"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=DocumentsDocumentTypeCategories
    def other_attributes
      %i[
        created description modified
      ]
    end
  end
end
