# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkCRMQuotation
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # Only the following filters are supported for this endpoint:
  # DeliveryAccount, DeliveryAccountContact, DeliveryAddress, Document, InvoiceAccount, InvoiceAccountContact, Opportunity, OrderAccount, OrderAccountContact, Project, QuotationID, QuotationNumber, QuotationDate, SelectionCode, Status, VersionNumber
  # 
  #
  # Scope
  # Crm quotes
  class BulkCRMQuotation
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/CRM/Quotations"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkCRMQuotations
    def other_attributes
      %i[
        quotation_id amount_dc amount_discount amount_discount_excl_vat amount_fc close_date
        closing_date created creator creator_full_name currency delivery_account
        delivery_account_code delivery_account_contact delivery_account_contact_full_name
        delivery_account_name delivery_address delivery_date description division document
        document_subject due_date incoterm_address incoterm_code incoterm_version invoice_account
        invoice_account_code invoice_account_contact invoice_account_contact_full_name
        invoice_account_name modified modifier modifier_full_name opportunity opportunity_name
        order_account order_account_code order_account_contact order_account_contact_full_name
        order_account_name payment_condition payment_condition_description project project_code
        project_description quotation_date quotation_number remarks sales_channel
        sales_channel_code sales_channel_description sales_person sales_person_full_name
        selection_code selection_code_code selection_code_description shipping_method
        shipping_method_description status status_description vat_amount_fc version_number your_ref
      ]
    end
  end
end
