# frozen_string_literal: true

module Elmas
  # Endpoint
  # Document
  #
  # Good to know
  # Use this endpoint to create, read, update and delete documents
  #
  # Scope
  # Organization documents
  class Document
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "documents/Documents"
    end

    def mandatory_attributes
      %i[
        subject type
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=DocumentsDocuments
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
