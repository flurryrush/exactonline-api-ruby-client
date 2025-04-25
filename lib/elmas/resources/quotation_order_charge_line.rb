# frozen_string_literal: true

module Elmas
  # Endpoint
  # QuotationOrderChargeLine
  #
  # Good to know
  # Use this endpoint to create, read, update and delete quotation's order charge lines.
  #   Note:    If only AmountFCExclVAT is posted, system will recalculate AmountFCInclVAT and vice versa.
  #   If both AmountFCExclVAT and AmountFCInclVAT are posted, AmountFCExclVAT will be leading.
  #  System will recalculate AmountFCInclVAT based on the posted AmountFCExclVAT
  #
  # Scope
  # Crm quotes
  class QuotationOrderChargeLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "crm/QuotationOrderChargeLines"
    end

    def mandatory_attributes
      %i[
        quotation_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMQuotationOrderChargeLines
    def other_attributes
      %i[
        amount_dc amount_fc_excl_vat amount_fc_incl_vat amount_vatfc division is_shipping_cost
        line_number order_charge order_charge_code order_charge_description
        order_charges_line_description vat_code vat_description vat_percentage
      ]
    end
  end
end
