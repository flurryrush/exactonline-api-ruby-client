# frozen_string_literal: true

module Elmas
  # Endpoint
  # Payment
  #
  # Good to know
  # Use this endpoint to get an overview of all the payments in your administration.
  #  Paymentlines are grouped by own bank account, account bank account, payment reference, payment method, entry date and status.
  #  Payments of one entry have the same TransactionId.
  #  Among other things, with this endpoint you can get information like the payments status (e.
  # g.
  #  Open, Processed) or when the payment is due.
  # PUT to this endpoint allows you to prepare an invoice for payment by adjusting the payment method, description and payment reference
  #
  # Scope
  # Financial cashflow
  class Payment
    include Elmas::Resource

    def valid_actions
      %i[get put]
    end

    def base_path
      "cashflow/Payments"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CashflowPayments
    def other_attributes
      %i[
        account account_bank_account_id account_bank_account_number account_code account_contact
        account_contact_name account_name amount_dc amount_discount_dc amount_discount_fc amount_fc
        bank_account_id bank_account_number cashflow_transaction_batch_code created creator
        creator_full_name currency description discount_due_date division document document_number
        document_subject due_date end_date end_period end_year entry_date entry_id entry_number
        gl_account gl_account_code gl_account_description invoice_date invoice_number
        is_batch_booking journal journal_description modified modifier modifier_full_name
        payment_batch_number payment_condition payment_condition_description payment_days
        payment_days_discount payment_discount_percentage payment_method payment_reference
        payment_selected payment_selector payment_selector_full_name rate_fc source status
        transaction_amount_dc transaction_amount_fc transaction_due_date transaction_entry_id
        transaction_id transaction_is_reversal transaction_reporting_period
        transaction_reporting_year transaction_status transaction_type your_ref
      ]
    end
  end
end
