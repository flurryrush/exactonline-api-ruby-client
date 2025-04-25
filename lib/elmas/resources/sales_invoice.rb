# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesInvoice
  #
  # Good to know
  # Use this endpoint to create, read, update and delete sales invoices or direct sales invoices.
  # Note: You must include a parameter for 'SalesInvoiceLines' to add sales invoice lines when you POST to the SalesInvoices endpoint.
  #  This parameter is not necessary when you PUT to this endpoint.
  #  Currently, assigning serial or batch numbers is not supported when you create or update direct sales invoices.
  # Sales invoice describe the items that you sell to your customers.
  # For more information about the sales invoice functionality in Exact Online, see About sales invoices  Direct sales invoices are entries that combine a normal sales invoice with a stock movement, whether it is in or out.
  #  For more information about the direct sales invoice functionality in Exact Online, see Create direct sales invoices or direct credit notes To view an example of the business use of this endpoint, see Rest API - Business example API sales invoice
  #
  # Scope
  # Sales invoices
  class SalesInvoice
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "salesinvoice/SalesInvoices"
    end

    def mandatory_attributes
      %i[
        journal ordered_by sales_invoice_lines
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesInvoiceSalesInvoices
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
        sales_channel_description sales_invoice_order_charge_lines salesperson
        salesperson_full_name selection_code selection_code_code selection_code_description
        shipping_method shipping_method_code shipping_method_description
        starter_sales_invoice_status starter_sales_invoice_status_description status
        status_description tax_schedule tax_schedule_code tax_schedule_description type
        type_description vat_amount_dc vat_amount_fc warehouse withholding_tax_amount_fc
        withholding_tax_base_amount withholding_tax_percentage your_ref
      ]
    end
  end
end
