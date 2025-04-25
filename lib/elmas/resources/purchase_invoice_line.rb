# frozen_string_literal: true

module Elmas
  # Endpoint
  # PurchaseInvoiceLine
  #
  # Good to know
  # Use this endpoint to create and read purchase invoice lines.
  # A purchase invoice line is always part of a purchase invoice and describes an item that you purchased from a supplier.
  #  A purchase invoice line can not be POSTed by itself.
  #  It has to be part of a POST of a purchase invoice.
  #  Each purchase invoice line has to contain either an item or a purchase order line.
  #  In a POST request it is important to know the type (including or excluding) of the VAT code.
  #  This type determines how the VAT amount is calculated in relation to the amount or price.
  #  For example an amount of 100 with a '21% including' VAT code results in a VAT amount of 17.
  # 36.
  #  With a '21% excluding' VAT code the VAT amount will be 21.
  # 00.
  #  When you don't specify a VAT code a default value will be used that is based on the configuration of the supplier and the item.
  #  We recommend to always specify Amount and VATCode when you create a new purchase invoice line for an item.
  # For more information about the purchase invoice functionality in Exact Online, see Create purchase invoices
  #
  # Scope
  # Purchase invoices
  class PurchaseInvoiceLine
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "purchase/PurchaseInvoiceLines"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PurchasePurchaseInvoiceLines
    def other_attributes
      %i[
        amount amount_dc cost_center cost_unit currency custom_field description discount expense
        expense_description invoice_id invoice_type item item_unit line_number modified net_price
        notes project purchase_order_line quantity quantity_in_default_units rebill unit unit_price
        vat_amount vat_code vat_percentage
      ]
    end
  end
end
