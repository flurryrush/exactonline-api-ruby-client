# frozen_string_literal: true

module Elmas
  # Endpoint
  # Quotation
  #
  # Good to know
  # 
  #
  # Scope
  # Crm quotes
  class Quotation
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "crm/Quotations"
    end

    def mandatory_attributes
      %i[
        order_account quotation_lines
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMQuotations
    def other_attributes
      %i[
        quotation_id amount_dc amount_discount amount_discount_excl_vat amount_fc close_date
        closing_date created creator creator_full_name currency delivery_account
        delivery_account_code delivery_account_contact delivery_account_contact_full_name
        delivery_account_name delivery_address delivery_date description division document
        document_subject due_date incoterm_address incoterm_code incoterm_version invoice_account
        invoice_account_code invoice_account_contact invoice_account_contact_full_name
        invoice_account_name modified modifier modifier_full_name opportunity opportunity_name
        order_account_code order_account_contact order_account_contact_full_name order_account_name
        payment_condition payment_condition_description project project_code project_description
        quotation_date quotation_number quotation_order_charge_lines remarks sales_channel
        sales_channel_code sales_channel_description sales_person sales_person_full_name
        selection_code selection_code_code selection_code_description shipping_method
        shipping_method_description status status_description vat_amount_fc version_number
        warehouse_code warehouse_description warehouse_id your_ref
      ]
    end
  end
end
