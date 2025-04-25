# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesInvoiceOrderChargeLine
  #
  # Good to know
  # Use this endpoint to create, read, update and delete sales invoice shipping cost and order charge lines.
  #  Note:   If only AmountFCExclVAT is posted, system will recalculate AmountFCInclVAT and vice versa.
  #    If both AmountFCExclVAT and AmountFCInclVAT are posted, AmountFCExclVAT will be leading.
  #  System will recalculate AmountFCInclVAT based on the posted AmountFCExclVAT.
  # To view an example of the business use of this endpoint, see Rest API - Business example API sales invoice
  #
  # Scope
  # Sales invoices
  class SalesInvoiceOrderChargeLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "salesinvoice/SalesInvoiceOrderChargeLines"
    end

    def mandatory_attributes
      %i[
        invoice_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesInvoiceSalesInvoiceOrderChargeLines
    def other_attributes
      %i[
        amount_dc amount_fc_excl_vat amount_fc_incl_vat amount_vatfc division gl_account
        gl_account_code gl_account_description is_shipping_cost line_number order_charge
        order_charge_code order_charge_description order_charges_line_description vat_code
        vat_description vat_percentage
      ]
    end
  end
end
