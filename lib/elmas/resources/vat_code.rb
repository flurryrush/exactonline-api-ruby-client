# frozen_string_literal: true

module Elmas
  # Endpoint
  # VATCode
  #
  # Good to know
  # 
  # 
  #
  # Scope
  # Financial accounting
  class VATCode
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "vat/VATCodes"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=VATVATCodes
    def other_attributes
      %i[
        account account_code account_name calculation_basis charged country created creator
        creator_full_name custom_field division eu_sales_listing exclude_vat_listing
        gl_discount_purchase gl_discount_purchase_code gl_discount_purchase_description
        gl_discount_sales gl_discount_sales_code gl_discount_sales_description gl_to_claim
        gl_to_claim_code gl_to_claim_description gl_to_pay gl_to_pay_code gl_to_pay_description
        intra_stat intrastat_type is_blocked legal_text modified modifier modifier_full_name
        oss_country percentage tax_return_type type vat_doc_type vat_margin vat_partial_ratio
        vat_percentages vat_transaction_type
      ]
    end
  end
end
