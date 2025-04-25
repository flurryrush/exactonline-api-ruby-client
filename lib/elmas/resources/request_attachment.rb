# frozen_string_literal: true

module Elmas
  # Endpoint
  # RequestAttachment
  #
  # Good to know
  # 
  #
  # Scope
  # Organization workflow
  class RequestAttachment
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "beta/{division}/workflow/RequestAttachments"
    end

    def mandatory_attributes
      %i[
        file_name
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=WorkflowRequestAttachments
    def other_attributes
      %i[
        division download_url file_size request
      ]
    end
  end
end
