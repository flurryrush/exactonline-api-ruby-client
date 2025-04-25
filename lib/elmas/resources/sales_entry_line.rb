# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesEntryLine
  #
  # Good to know
  # Use this endpoint to create, read, update or delete the entry lines of sales entries  created for your sales invoices.
  #  Note: Sales entries are separated to header and line information.
  #  Endpoint SalesEntryLines is used for the line information.
  #   The relevance of properties is very much depending on the legislation and the package used.
  #  
  #
  # Scope
  # Financial accounting
  class SalesEntryLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "salesentry/SalesEntryLines"
    end

    def mandatory_attributes
      %i[
        amount_fc entry_id gl_account
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesEntrySalesEntryLines
    def other_attributes
      %i[
        amount_dc asset asset_description cost_center cost_center_description cost_unit
        cost_unit_description custom_field description division extra_duty_amount_fc
        extra_duty_percentage from gl_account_code gl_account_description intra_stat_area
        intra_stat_country intra_stat_delivery_term intra_stat_transaction_a
        intra_stat_transaction_b intra_stat_transport_method line_number notes project
        project_description project_wbs project_wbs_description quantity serial_number
        statistical_net_weight statistical_number statistical_quantity statistical_value
        subscription subscription_description tax_schedule to tracking_number
        tracking_number_description type vat_amount_dc vat_amount_fc vat_base_amount_dc
        vat_base_amount_fc vat_code vat_code_description vat_percentage
      ]
    end
  end
end
