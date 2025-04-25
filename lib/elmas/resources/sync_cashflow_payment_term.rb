# frozen_string_literal: true

module Elmas
  # Endpoint
  # SyncCashflowPaymentTerm
  #
  # Good to know
  # The PaymentTerms sync api returns both payments and receipts.
  #  To filter out payments you need to filter on property ApprovalStatus and LineType.
  #  Approval for payments is a feature which only turned on in some subscriptions.
  #  By default this feature is off and in that case the ApprovalStatus will be null.
  #  To filter out receipts  you need to filter only on LineType.
  #  The API does not allow to filter on these fields.
  #  Filtering need to be done after receiving the records.
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
  # 
  #
  # Scope
  # Financial cashflow
  class SyncCashflowPaymentTerm
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sync/Cashflow/PaymentTerms"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SyncCashflowPaymentTerms
    def other_attributes
      %i[
        timestamp account account_bank_account_id account_bank_account_number account_code
        account_contact account_contact_name account_country account_name amount_dc
        amount_discount_dc amount_discount_fc amount_fc approval_status bank_account_id
        bank_account_number cashflow_transaction_batch_code created creator creator_full_name
        currency description direct_debit_mandate direct_debit_mandate_description
        direct_debit_mandate_payment_type direct_debit_mandate_reference direct_debit_mandate_type
        discount_due_date division document document_number document_subject due_date end_date
        end_period end_to_end_id end_year entry_date entry_id entry_number gl_account
        gl_account_code gl_account_description invoice_date invoice_number is_batch_booking
        is_fully_paid journal journal_description last_payment_date line_type modified modifier
        modifier_full_name order_number payment_batch_number payment_condition
        payment_condition_description payment_days payment_days_discount
        payment_discount_percentage payment_information_id payment_method payment_reference
        payment_selected payment_selector payment_selector_full_name rate_fc
        receivable_batch_number receivable_selected receivable_selector
        receivable_selector_full_name source status transaction_amount_dc transaction_amount_fc
        transaction_due_date transaction_entry_id transaction_id transaction_is_reversal
        transaction_reporting_period transaction_reporting_year transaction_status transaction_type
        your_ref
      ]
    end
  end
end
