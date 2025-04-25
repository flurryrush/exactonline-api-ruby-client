# frozen_string_literal: true

module Elmas
  # Endpoint
  # OutstandingInvoicesOverview
  #
  # Good to know
  # Use this endpoint to get an overall stastictic of your Suppliers or Customers outstanding items.
  #  From this API, you can know1.
  #  The total number of invoices and the amount that needs to be paid2.
  #  The total number of invoices and the amount that needs to be collected3.
  #  The total number of overdue invoices and the  amount that needs to be paid4.
  #  The total number of overdue invoices and the amount that needs to be collected
  #
  # Scope
  # Financial receivables financial payables
  class OutstandingInvoicesOverview
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/OutstandingInvoicesOverview"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialOutstandingInvoicesOverview
    def other_attributes
      %i[
        currency_code outstanding_payable_invoice_amount outstanding_payable_invoice_count
        outstanding_receivable_invoice_amount outstanding_receivable_invoice_count
        overdue_payable_invoice_amount overdue_payable_invoice_count
        overdue_receivable_invoice_amount overdue_receivable_invoice_count
      ]
    end
  end
end
