# frozen_string_literal: true

module Elmas
  # Endpoint
  # GLScheme
  #
  # Good to know
  # Use this endpoint to retrieve the G/L schemes used in an administration.
  #  Depending on package used, there is one or more scheme (e.
  # g.
  #  RGS in different versions) available.
  #  For more information about G/L schemes, you can visit the following help file G/L account schemes
  #
  # Scope
  # Financial generalledgers
  class GLScheme
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "financial/GLSchemes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialGLSchemes
    def other_attributes
      %i[
        code created creator creator_full_name description division main modified modifier
        modifier_full_name target_namespace
      ]
    end
  end
end
