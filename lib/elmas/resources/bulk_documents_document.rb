# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkDocumentsDocument
  #
  # Good to know
  # This end point returns one or more documents of a given company.
  # This bulk service has a page size of 1000.
  # 
  # Only the following filters are supported for this endpoint:
  # Account, Category, Contact, Created, Creator, Division, DocumentDate, DocumentFolder, FinancialTransactionEntryID, HID, ID, Modified, Opportunity, Project, SalesInvoiceNumber, Subject, Type
  # 
  #
  # Scope
  # Organization documents
  class BulkDocumentsDocument
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/Documents/Documents"
    end

    def mandatory_attributes
      %i[
        subject type
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkDocumentsDocuments
    def other_attributes
      %i[
        account account_code account_name amount_fc body category category_description contact
        contact_full_name contract_id contract_number created creator creator_full_name currency
        division document_date document_folder document_folder_code document_folder_description
        document_view_url expiry_date financial_transaction_entry_id has_empty_body hid
        inherit_share item item_code item_description language modified modifier modifier_full_name
        opportunity project project_code project_description proposed_entry_status
        sales_invoice_number sales_order_number scan_service_status send_method shop_order_number
        teams_meeting_id type_description
      ]
    end
  end
end
