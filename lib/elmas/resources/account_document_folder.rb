# frozen_string_literal: true

module Elmas
  # Endpoint
  # AccountDocumentFolder
  #
  # Good to know
  # The function will return a document folder description that consists ofdescription and count of documents in this folder in the brackets based on the accountIdthat has been requested
  #
  # Scope
  # Organization documents
  class AccountDocumentFolder
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/crm/AccountDocumentFolders"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadCRMAccountDocumentFolders
    def other_attributes
      %i[
        code count_of_documents created creator creator_full_name description division
        is_root_con_v2 modified modifier modifier_full_name parent_folder share
        share_point_connection_status share_point_id
      ]
    end
  end
end
