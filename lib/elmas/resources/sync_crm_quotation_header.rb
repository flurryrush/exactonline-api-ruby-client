# frozen_string_literal: true

module Elmas
  # Endpoint
  # SyncCRMQuotationHeader
  #
  # Good to know
  # Any change in the header of the Quotations will lead to a new timestamp value in the header.
  #  The API will return header data in the API call.
  # 
  # The sync api's have the goal to keep the data between Exact Online and a 3rd party application the same.
  # 
  # The sync api's are all based on row versioning and because of that it is guaranteed to be unique.
  #  Every time an existing record is changed or a new record is inserted, the row versioning value is higher than the highest available value at that time.
  #  When retrieving records via these api's also a timestamp value is returned.
  #  The highest timestamp value of the records returned should be stored on client side.
  #  Next time records are retrieved, the timestamp value stored on client side should be provided as parameter.
  #  The api will then return only the new and changed records.
  #  Using this method is more reliable than using modified date, since it can happen that multiple records have the same modified date and therefore same record can be returned more than once.
  #  This will not happen when using timestamp.
  # 
  # The sync api's are also developed to give best performance when retrieving records.
  #  Because of performance and the intended purpose of the api's, only the timestamp field is allowed as parameter.
  # 
  # The single and bulk apiâs are designed for a different purpose.
  #  They provide ability to retrieve specific record or a set of records which meet certain conditions.
  # 
  # In case the division is moved to another database in Exact Online the timestamp values will be reset.
  #  Therefore, after a division is moved all data needs to be synchronized again in order to get the new timestamp values.
  #  To see if a division was moved, the /api/v1/{division}/system/Divisions can be used.
  #  The property DivisionMoveDate indicated at which date a division was moved and this date can be used to determine if it is needed to synchronize all data again.
  # 
  # The API has two important key fields, the Timestamp and the ID.
  #  The ID should be used to uniquely identify the record and will never change
  # .
  #  The Timestamp is used to get new or changed records in an efficient way and will change for every change made to the record.
  # 
  # The timestamp value returned has no relation with actual date or time.
  #  As such it cannot be converted to a date\time value.
  #  The timestamp is a rowversion value.
  # 
  # When you use the sync or delete api for the first time for a particular division, filter on timestamp greater than 1.
  # 
  # Or use the SyncTimestamp API to GET a timestamp from a certain date.
  # 
  # 
  #
  # Scope
  # Crm quotes
  class SyncCRMQuotationHeader
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sync/CRM/QuotationHeaders"
    end

    def mandatory_attributes
      %i[
        order_account quotation_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SyncCRMQuotationHeaders
    def other_attributes
      %i[
        timestamp amount_dc amount_discount amount_discount_excl_vat amount_fc close_date
        closing_date created creator creator_full_name currency delivery_account
        delivery_account_code delivery_account_contact delivery_account_contact_full_name
        delivery_account_name delivery_address delivery_date description discount division document
        document_subject due_date incoterm_address incoterm_code incoterm_version invoice_account
        invoice_account_code invoice_account_contact invoice_account_contact_full_name
        invoice_account_name modified modifier modifier_full_name notes opportunity
        opportunity_name order_account_code order_account_contact order_account_contact_full_name
        order_account_name payment_condition payment_condition_description project project_code
        project_description quotation_date quotation_number remarks sales_channel
        sales_channel_code sales_channel_description sales_person sales_person_full_name
        selection_code selection_code_code selection_code_description shipping_method
        shipping_method_description status status_description version_number your_ref
      ]
    end
  end
end
