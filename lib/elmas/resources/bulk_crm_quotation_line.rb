# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkCRMQuotationLine
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # Only the following filters are supported for this endpoint:
  # Item, LineNumber, QuotationID, QuotationNumber, VersionNumber, VATCode
  # 
  #
  # Scope
  # Crm quotes
  class BulkCRMQuotationLine
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/CRM/QuotationLines"
    end

    def mandatory_attributes
      %i[
        item quotation_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkCRMQuotationLines
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
