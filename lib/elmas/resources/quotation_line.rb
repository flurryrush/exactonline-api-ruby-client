# frozen_string_literal: true

module Elmas
  # Endpoint
  # QuotationLine
  #
  # Good to know
  # 
  #
  # Scope
  # Crm quotes
  class QuotationLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "crm/QuotationLines"
    end

    def mandatory_attributes
      %i[
        item quotation_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMQuotationLines
    def other_attributes
      %i[
        amount_dc amount_fc cost_center cost_center_description cost_unit cost_unit_description
        customer_item_code custom_field description discount division item_description line_number
        net_price notes optional quantity quotation_number unit_code unit_description unit_price
        vat_amount_fc vat_code vat_description vat_percentage version_number
      ]
    end
  end
end
