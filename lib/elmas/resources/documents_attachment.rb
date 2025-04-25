# frozen_string_literal: true

module Elmas
  # Endpoint
  # DocumentsAttachment
  #
  # Good to know
  # 
  #
  # Scope
  # Organization documents
  class DocumentsAttachment
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/crm/DocumentsAttachments"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadCRMDocumentsAttachments
    def other_attributes
      %i[
        attachment_file_name attachment_file_size attachment_url can_show_in_web_view
      ]
    end
  end
end
