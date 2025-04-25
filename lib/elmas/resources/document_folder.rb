# frozen_string_literal: true

module Elmas
  # Endpoint
  # DocumentFolder
  #
  # Good to know
  # Use this endpoint to create, read, update and delete document folders
  #
  # Scope
  # Organization documents
  class DocumentFolder
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "documents/DocumentFolders"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=DocumentsDocumentFolders
    def other_attributes
      %i[
        created creator creator_full_name division modified modifier modifier_full_name
        parent_folder share
      ]
    end
  end
end
