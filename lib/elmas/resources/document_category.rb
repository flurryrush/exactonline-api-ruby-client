# frozen_string_literal: true

module Elmas
  # Endpoint
  # DocumentCategory
  #
  # Good to know
  # This end point returns a list of document categories
  #
  # Scope
  # Organization documents
  class DocumentCategory
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "documents/DocumentCategories"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=DocumentsDocumentCategories
    def other_attributes
      %i[
        created description modified
      ]
    end
  end
end
