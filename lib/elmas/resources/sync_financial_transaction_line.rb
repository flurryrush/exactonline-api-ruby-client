# frozen_string_literal: true

module Elmas
  # Endpoint
  # SyncFinancialTransactionLine
  #
  # Good to know
  # The API will return both header and line data in the same API call, to determine if the record is the header or the line, the line number can be used.
  #  If the line number is 0 it is the transaction line header, if the line number is 1 or higher it is a transaction line.
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
  # Financial accounting
  class SyncFinancialTransactionLine
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sync/Financial/TransactionLines"
    end

    def mandatory_attributes
      %i[
        entry_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SyncFinancialTransactionLines
    def other_attributes
      %i[
        timestamp account account_code account_name amount_dc amount_fc amount_vat_base_fc
        amount_vatfc asset asset_code asset_description cost_center cost_center_description
        cost_unit cost_unit_description created creator creator_full_name currency custom_field
        date description division document document_number document_subject due_date entry_number
        exchange_rate external_link_description external_link_reference extra_duty_amount_fc
        extra_duty_percentage financial_period financial_year gl_account gl_account_code
        gl_account_description invoice_number item item_code item_description journal_code
        journal_description line_number line_type modified modifier modifier_full_name notes
        offset_id order_number payment_discount_amount payment_reference project project_code
        project_description project_wbs project_wbs_description quantity serial_number status
        subscription subscription_description tracking_number tracking_number_description type
        vat_code vat_code_description vat_percentage vat_type your_ref
      ]
    end
  end
end
