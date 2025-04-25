# frozen_string_literal: true

module Elmas
  # Endpoint
  # DocumentTypeFolder
  #
  # Good to know
  # Use this endpoint to create, read, update and delete document type folders
  #
  # Scope
  # Organization documents
  class DocumentTypeFolder
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "documents/DocumentTypeFolders"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=DocumentsDocumentTypeFolders
    def other_attributes
      %i[
        created creator division document_folder document_type modified modifier
      ]
    end
  end
end
