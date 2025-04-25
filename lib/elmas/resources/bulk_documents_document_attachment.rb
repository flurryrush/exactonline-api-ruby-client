# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkDocumentsDocumentAttachment
  #
  # Good to know
  # To be able to upload an attachment (i.
  # e.
  #  a PDF file) you first need to create a (empty) document.
  # This bulk service has a page size of 1000.
  # 
  # Only the following filters are supported for this endpoint:
  # Document, ID
  # 
  #
  # Scope
  # Organization documents
  class BulkDocumentsDocumentAttachment
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/Documents/DocumentAttachments"
    end

    def mandatory_attributes
      %i[
        attachment document file_name
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkDocumentsDocumentAttachments
    def other_attributes
      %i[
        file_size url
      ]
    end
  end
end
