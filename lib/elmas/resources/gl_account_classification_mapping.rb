# frozen_string_literal: true

module Elmas
  # Endpoint
  # GLAccountClassificationMapping
  #
  # Good to know
  # 
  #
  # Scope
  # Financial generalledgers
  class GLAccountClassificationMapping
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "financial/GLAccountClassificationMappings"
    end

    def mandatory_attributes
      %i[
        classification gl_account gl_scheme_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialGLAccountClassificationMappings
    def other_attributes
      %i[
        classification_code classification_description division gl_account_code
        gl_account_description gl_scheme_code gl_scheme_description
      ]
    end
  end
end
