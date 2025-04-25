# frozen_string_literal: true

module Elmas
  # Endpoint
  # DocumentType
  #
  # Good to know
  # Use this endpoint to retrieve a list of document types
  #
  # Scope
  # Organization documents
  class DocumentType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "documents/DocumentTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=DocumentsDocumentTypes
    def other_attributes
      %i[
        created description document_is_creatable document_is_deletable document_is_updatable
        document_is_viewable modified type_category
      ]
    end
  end
end
