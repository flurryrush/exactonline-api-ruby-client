# frozen_string_literal: true

module Elmas
  # Endpoint
  # PurchaseInvoice
  #
  # Good to know
  # Use this endpoint to create, read, update and delete purchase invoices.
  # A purchase invoice describes the items that you purchased from a supplier.
  #  This endpoint supports purchase invoices and direct purchase invoices.
  #  Each purchase invoice line has to contain either an item or a purchase order line.
  # The direct purchase invoice is a purchase invoice and receipt at the same time.
  #  A purchase order is not required and the stock positions and financial entries are updated directly.
  # To create a direct purchase invoice you have to specify the warehouse that is receiving the purchased items.
  #  To get only direct purchase invoices apply this filter on warehouse: $filter=Warehouse ne nullCurrently project WBS (work breakdown structure) and rebilling functionality are not supported.
  # For more information about the purchase invoice functionality in Exact Online, see Create purchase invoices
  #
  # Scope
  # Purchase invoices
  class PurchaseInvoice
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "purchase/PurchaseInvoices"
    end

    def mandatory_attributes
      %i[
        journal purchase_invoice_lines supplier type
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PurchasePurchaseInvoices
    def other_attributes
      %i[
        amount amount_dc amount_discount amount_discount_excl_vat amount_fc_excl_vat
        contact_person currency description discount document due_date entry_number exchange_rate
        financial_period financial_year invoice_date modified payment_condition payment_reference
        remarks source status vat_amount warehouse your_ref
      ]
    end
  end
end
