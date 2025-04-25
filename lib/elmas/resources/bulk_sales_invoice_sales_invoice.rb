# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkSalesInvoiceSalesInvoice
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # 
  #
  # Scope
  # Sales invoices
  class BulkSalesInvoiceSalesInvoice
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/SalesInvoice/SalesInvoices"
    end

    def mandatory_attributes
      %i[
        journal ordered_by sales_invoice_lines
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkSalesInvoiceSalesInvoices
    def other_attributes
      %i[
        invoice_id amount_dc amount_discount amount_discount_excl_vat amount_fc amount_fc_excl_vat
        created creator creator_full_name currency deliver_to deliver_to_address
        deliver_to_contact_person deliver_to_contact_person_full_name deliver_to_name description
        discount discount_type division document document_number document_subject due_date
        extra_duty_amount_fc g_account_amount_fc incoterm_address incoterm_code incoterm_version
        invoice_date invoice_number invoice_to invoice_to_contact_person
        invoice_to_contact_person_full_name invoice_to_name is_extra_duty journal_description
        modified modifier modifier_full_name order_date ordered_by_contact_person
        ordered_by_contact_person_full_name ordered_by_name order_number payment_condition
        payment_condition_description payment_reference remarks sales_channel sales_channel_code
        sales_channel_description salesperson salesperson_full_name selection_code
        selection_code_code selection_code_description shipping_method shipping_method_code
        shipping_method_description starter_sales_invoice_status
        starter_sales_invoice_status_description status status_description tax_schedule
        tax_schedule_code tax_schedule_description type type_description vat_amount_dc
        vat_amount_fc warehouse withholding_tax_amount_fc withholding_tax_base_amount
        withholding_tax_percentage your_ref
      ]
    end
  end
end
