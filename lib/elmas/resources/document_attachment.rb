# frozen_string_literal: true

module Elmas
  # Endpoint
  # DocumentAttachment
  #
  # Good to know
  # Use this endpoint to create, read and delete attachments of one or more documents
  #
  # Scope
  # Organization documents
  class DocumentAttachment
    include Elmas::Resource

    def valid_actions
      %i[get post delete]
    end

    def base_path
      "documents/DocumentAttachments"
    end

    def mandatory_attributes
      %i[
        attachment document file_name
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=DocumentsDocumentAttachments
    def other_attributes
      %i[
        file_size url
      ]
    end
  end
end
