# frozen_string_literal: true

module Elmas
  # Endpoint
  # PurchaseEntryLine
  #
  # Good to know
  # Use this endpoint to create, read, update or delete the entry lines of purchase entries created for your purchase invoices.
  # Note: Purchase entries are separated to header and line information.
  #  Endpoint PurchaseEntryLines is used for the line information.
  # The relevance of properties is very much depending on the legislation and the package used.
  #  
  #
  # Scope
  # Financial accounting
  class PurchaseEntryLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "purchaseentry/PurchaseEntryLines"
    end

    def mandatory_attributes
      %i[
        amount_fc entry_id gl_account
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PurchaseEntryPurchaseEntryLines
    def other_attributes
      %i[
        amount_dc asset asset_description cost_center cost_center_description cost_unit
        cost_unit_description custom_field description division expense expense_description from
        gl_account_code gl_account_description intra_stat_area intra_stat_country
        intra_stat_delivery_term intra_stat_transaction_a intra_stat_transaction_b
        intra_stat_transport_method line_number notes private_use_percentage project
        project_description quantity serial_number statistical_net_weight statistical_number
        statistical_quantity statistical_value subscription subscription_description to
        tracking_number tracking_number_description type vat_amount_dc vat_amount_fc
        vat_base_amount_dc vat_base_amount_fc vat_code vat_code_description
        vat_non_deductible_percentage vat_percentage withholding_amount_dc withholding_tax
      ]
    end
  end
end
