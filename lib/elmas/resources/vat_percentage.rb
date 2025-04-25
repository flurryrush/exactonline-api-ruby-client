# frozen_string_literal: true

module Elmas
  # Endpoint
  # VatPercentage
  #
  # Good to know
  # 
  # 
  #
  # Scope
  # Financial accounting
  class VatPercentage
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "vat/VatPercentages"
    end

    def mandatory_attributes
      %i[
        vat_code_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=VATVatPercentages
    def other_attributes
      %i[
        created creator creator_full_name division end_date line_number modified modifier
        modifier_full_name percentage start_date type
      ]
    end
  end
end
